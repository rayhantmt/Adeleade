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
import 'package:mementum/api/api_services.dart';
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

  //final ApiService _apiService = ApiService(); // Assuming you have ApiService

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
      Get.snackbar('Error', 'Failed to load profile data');
    } finally {
      isLoading.value = false;
    }
  }

  int calculateAge() {
    // You can implement age calculation based on createdAt or add a DOB field
    // For now, returning a default value
    return 25;
  }
}
