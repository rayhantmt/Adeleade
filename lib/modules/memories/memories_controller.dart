import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mementum/api/api_config.dart';
import 'package:mementum/api/api_services.dart';
import 'package:mementum/api/dio_client.dart';
import 'package:mementum/core/exceptions.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mementum/modules/home/home_model.dart';
import 'package:mementum/modules/memories/connections_model.dart';

class MemoriesController extends GetxController {
  var memorytype = 0.obs;
  RxInt selectedParticipants = 0.obs;
  final List<int> participantsList = [2, 4, 6, 8, 10, 15, 20, 30];

  Rxn<XFile> eventImage = Rxn<XFile>();
  void setDepositType(int type) {
    memorytype.value = type;
  }

  final ImagePicker _picker = ImagePicker();
  Future pickEventImage() async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      if (picked != null) {
        eventImage.value = picked;
        eventImage.refresh();
        print('Event Image picked: ${picked.path}');
        Get.snackbar('Event image', picked.path);
      } else {
        print('Cover pick cancelled');
      }
    } catch (e) {
      print('Error picking event image: $e');
      Get.snackbar('Error', 'Failed to pick event image: $e');
    }
  }

  RxBool isLoading = false.obs;
  final DioClient _client = DioClient();
  final namecontroller = TextEditingController();
  final eventdatecontroller = TextEditingController();
  final locationcontroller = TextEditingController();
  final cetegorycontroller = TextEditingController();
  final detailscontroller = TextEditingController();
  final maxParticipantscontroller = TextEditingController();
  Future<void> createEvent() async {
    final storage = GetStorage();
    final token = storage.read('token');
    isLoading.value = true;
    if (eventImage.value == null) {
      Get.snackbar('Error', 'Please select a profile image');
      return;
    }

    try {
      final formData = FormData.fromMap({
        'name': namecontroller.text.toString(),
        'eventDate': eventdatecontroller.text.toString(),
        'location': locationcontroller.text.toString(),
        'category': cetegorycontroller.text.toString(),
        'details': detailscontroller.text.toString(),
        //'maxParticipants': maxParticipantscontroller.text.toString(),
        'maxParticipants': selectedParticipants.toString(),
        'geoLocation': '$latitude,$longitude',
        'eventImage': await MultipartFile.fromFile(
          eventImage.value!.path,
          filename: eventImage.value!.name,
          contentType: MediaType('image', 'png'),
        ),
      });
      // print('Bearer ${token}');
      // 4. API Call
      final response = await _client.postFormData(
        url: '${ApiConfig.baseUrl}/api/v1/event/create',
        data: formData,
        headers: {
          'Authorization': 'Bearer ${token}',
          'Content-type': 'multipart/form-data',
        },
      );

      print('✅ event Created: ${response.data}');
      Get.snackbar('Success', 'Event Created Successfully');
    } on BadRequestException catch (e) {
      // Caught by our custom DioClient logic
      Get.snackbar('Registration Failed', e.toString());
      print('❌ API Error: $e');
    } on DioException catch (e) {
      // Catch generic Dio errors that might slip through
      Get.snackbar('Error', 'Network error: ${e.message}');
    } catch (e) {
      // Catch logic errors (like the one you were seeing)
      print('❌ Unexpected Error: $e');
      Get.snackbar('Error', 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }

  var myevents = <Event>[].obs;
  //my events fetching block

  Future<void> fetchmmyEvents() async {
    final storage = GetStorage();
    final token = storage.read('token');
    isLoading.value = true;
    try {
      final response = await ApiService.get(
        endpoint: ApiConfig.getmyevents,
        headers: {'Authorization': token},
      );

      if (response['success'] == true) {
        final List<dynamic> joinedJson = response['data']['joinedEvents'] ?? [];
        final List<dynamic> createdJson =
            response['data']['createdEvents'] ?? [];
        final List<dynamic> combinedEvents = [...joinedJson, ...createdJson];

        // 3. Map the combined list to your Event model
        myevents.value = combinedEvents
            .map((json) => Event.fromJson(json))
            .toList();
        Get.snackbar(
          'Success',
          response['message'] ?? 'Events loaded successfully',
          snackPosition: SnackPosition.TOP,
        );
      } else {
        throw Exception('Failed to load events');
      }
    } on BadRequestException catch (e) {
      Get.snackbar('Error', e.message, snackPosition: SnackPosition.BOTTOM);
    } on UnauthorizedException catch (e) {
      Get.snackbar(
        'Unauthorized',
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } on NotFoundException catch (e) {
      Get.snackbar('Not Found', e.message, snackPosition: SnackPosition.BOTTOM);
    } on InternalServerException catch (e) {
      Get.snackbar(
        'Server Error',
        'Something went wrong. $e Please try again later.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FetchDataException catch (e) {
      Get.snackbar(
        'Network Error',
        'Please check your internet connection $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchmmyEvents();
    fetchConnections();
    super.onInit();
  }

  var isLoading5 = true.obs;
  RxList<Connection> connections = <Connection>[].obs;
  var totalCount = 0.obs;

  Future<void> fetchConnections() async {
    final tokena = GetStorage().read('token');
    try {
      isLoading.value = true;

      final response = await ApiService.get(
        endpoint: ApiConfig.getmyconnection,
        headers: {"Authorization": tokena},
      ); // Adjust endpoint
      print(response);
      if (response != null && response['success'] == true) {
        final connectionsResponse = ConnectionsResponse.fromJson(response);
        connections.value = connectionsResponse.data.connections;
        totalCount.value = connectionsResponse.data.count;
      }
    } catch (e) {
      print('Error fetching connections: $e');
      Get.snackbar('Error', 'Failed to load connections');
    } finally {
      isLoading.value = false;
    }
  }

  // Navigate to profile details
  // void navigateToProfile(String userId) {
  //   Get.toNamed(AppPages.profile_details, arguments: {'id': userId});
  // }

  // Refresh connections
  Future<void> refreshConnections() async {
    await fetchConnections();
  }

  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar(
          'Location Services Disabled',
          'Please enable location services',
          snackPosition: SnackPosition.TOP,
        );
        Geolocator.openLocationSettings();
        return;
      }

      // Check location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar(
            'Permission Denied',
            'Location permission is required',
            snackPosition: SnackPosition.TOP,
          );
          Geolocator.openLocationSettings();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Get.snackbar(
          'Permission Denied',
          'Location permissions are permanently denied',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      latitude = position.latitude;
      longitude = position.longitude;
Get.snackbar('Success','Your location fetched successfully');
      print('Latitude: $latitude, Longitude: $longitude');
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to get location: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
