// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:mementum/modules/profile_details/profile_model.dart';
// import 'package:mementum/utils/app_images.dart';

// class ProfileController extends GetxController{
//   var gallery=[
//     ProfileModel(image: AppImages.event1,),
//      ProfileModel(image: AppImages.event2,),
//       ProfileModel(image: AppImages.event3,),
//   ];
//   late  String id;

//   @override
//   void onInit() {
//    var arg=Get.arguments;

//   id=arg['id'];
//   print(id);
//   final storage=GetStorage();

//   var  uid= storage.read('id');
//   print('Userid $uid');
//     super.onInit();
//   }

// }
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mementum/api/api_config.dart';
import 'package:mementum/api/api_services.dart';
import 'package:mementum/core/exceptions.dart';
import 'package:mementum/modules/chat_room/chat_room_model.dart';
import 'package:mementum/modules/profile_details/profile_model.dart';
import 'package:mementum/utils/app_images.dart'; // Adjust the import path based on your project

class ProfileController extends GetxController {
  var gallery = [
    ProfileModel(image: AppImages.event1),
    ProfileModel(image: AppImages.event2),
    ProfileModel(image: AppImages.event3),
  ];

  late String id;
  late String token;
  // Observables for API data
  var isLoading = true.obs;
  Rx<User?> userData = Rx<User?>(null);
  RxList<Event> createdEvents = <Event>[].obs;

  @override
  void onInit() {
    var arg = Get.arguments;
    id = arg['id'];
    final storage = GetStorage();
    token = storage.read('token');
    print(id);
    fetchProfileData();
    super.onInit();
  }

  Future<void> fetchProfileData() async {
    try {
      isLoading.value = true;

      final response = await ApiService.get(
        endpoint: '/api/v1/user/profile/$id',
        headers: {"Authorization": "Bearer $token"},
      );

      if (response != null && response['success'] == true) {
        final profileResponse = ProfileApiResponse.fromJson(response);
        userData.value = profileResponse.data.user;
        createdEvents.value = profileResponse.data.createdEvents;

        // Update gallery with actual photos from API
        if (userData.value!.galleryPhotos.isNotEmpty) {
          gallery = userData.value!.galleryPhotos
              .map((url) => ProfileModel(image: url))
              .toList();
        }
      }
    } catch (e) {
      print('Error fetching profile: $e');
      //Get.snackbar('Error', 'Failed to load profile data');
    } finally {
      isLoading.value = false;
    }
  }

  int calculateAge() {
    // You can implement age calculation based on createdAt or add a DOB field
    // For now, returning a default value
    return 25;
  }
  RxBool isConnecting = false.obs;
  Future<void> sendconnectionrequest() async {
    isConnecting.value = true;
    try {
      final connectionrequestresponse = await ApiService.post(
        endpoint: ApiConfig.sendconnectionrequest,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-type': 'application/json',
        },
        body: {"connectionId": id},
      );
      print(connectionrequestresponse);
      Get.snackbar(connectionrequestresponse['message'], '');
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
        '$e Please try again later.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FetchDataException catch (e) {
      Get.snackbar('Error', '$e', snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      print('Error: $e');
    } finally {
      isConnecting.value = false;
    }
  }

  //Rx<ChatRoom?> chatRoominfo = Rx<ChatRoom?>(null);
  RxList<ChatRoom> chatro = <ChatRoom>[].obs;
  Future<void> getchatroomid() async {
    try {
      isLoading.value = true;

      final response = await ApiService.get(
        endpoint: '/api/v1/chat/direct/$id',
        headers: {"Authorization": token},
      );
      print(response);
      if (response != null) {
        chatro.value = [ChatRoom.fromJson(response)];
      }
    } catch (e) {
      print('Error fetching profile: $e');
      //Get.snackbar('Error', 'Failed to load profile data');
    } finally {
      isLoading.value = false;
    }
  }
}
