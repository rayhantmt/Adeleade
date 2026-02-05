import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mementum/api/api_config.dart';
import 'package:mementum/api/api_services.dart';
import 'package:mementum/core/exceptions.dart';
import 'package:mementum/modules/home/home_model.dart';
import 'package:mementum/routes/app_pages.dart';
import 'package:mementum/services/socket_service.dart';

class HomeController extends GetxController {
  var ctgry = [
    Category(categories: 'All'),
    Category(categories: 'Sports'),
    Category(categories: 'Music'),
    Category(categories: 'Art'),
    Category(categories: 'Technology'),
    Category(categories: 'Food'),
    Category(categories: 'Education'),
    Category(categories: 'Business'),
    Category(categories: 'Health'),
    Category(categories: 'Travel'),
    Category(categories: 'Social'),
    Category(categories: 'Other'),
  ].obs;
  // Add this variable
  var selectedCategoryIndex = 0.obs;

  // Add this function
  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  void printToken() {
    final storage = GetStorage();
    final token = storage.read('token'); // read the saved token
    print('Saved Token: $token'); // prints it
  }

  var isLoading = false.obs;
  var events = <Event>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchEvents();
  }
// Inside your Controller (e.g., HomeController)
final RxSet<Marker> markers = <Marker>{}.obs;

void updateMarkers() {
  markers.value = events.map((event) {
    // 1. Parse your geoLocation string "lat,long" or whatever your format is
    // Assuming geoLocation is "26.0247, 88.4702"
    List<String> coords = event.geoLocation.split(',');
    double lat = double.tryParse(coords[0].trim()) ?? 0.0;
    double lng = double.tryParse(coords[1].trim()) ?? 0.0;

    return Marker(
      markerId: MarkerId(event.id), // Use the unique API ID
      position: LatLng(lat, lng),
      infoWindow: InfoWindow(
        title: event.title,
        snippet: '${event.joinedPeople}/${event.maxPeople} joined',
        onTap: () {
          // 2. Navigation logic identical to your ListView
          Get.toNamed(
            AppPages.eventdetails,
            arguments: {
              'image': event.image,
              'tittle': event.title,
              'location': event.location,
              'time': event.formattedDate,
              'joinedpeople': event.joinedPeople,
              'eventDeatils': event.details,
              'hostedby': event.organizerName,
              'hostphotourl': event.organizerPhoto,
              'maxpeople': event.maxPeople,
              'id': event.id,
              'perticanpants': event.participants,
              'hostid': event.organizerId,
            },
          );
        },
      ),
    );
  }).toSet();
}
  Future<void> fetchEvents() async {
    await socketService.connect();
    final userId = GetStorage().read('id');
    socketService.joinUserRoom(userId);
    final storage = GetStorage();
    final token = storage.read('token');
    isLoading.value = true;
    try {
      final response = await ApiService.get(
        endpoint: ApiConfig.eventsEndpoint,
        headers: {'Authorization': token},
      );

      if (response['success'] == true) {
        final List<dynamic> eventsJson = response['data']['events'];
        events.value = eventsJson.map((json) => Event.fromJson(json)).toList();
updateMarkers();
        Get.snackbar(
          'Success',
          response['message'] ?? 'Events loaded successfully',
          snackPosition: SnackPosition.BOTTOM,
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
      //updateMarkers();
    } catch (e) {
      Get.snackbar(
        'Error',
        'An unexpected error occurred',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Refresh events
  Future<void> refreshEvents() async {
    await fetchEvents();
  }
}
