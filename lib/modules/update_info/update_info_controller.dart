import 'package:get/get.dart';
import 'package:mementum/api/api_config.dart';
import 'package:mementum/api/api_services.dart';
import 'package:mementum/core/exceptions.dart';

class UpdateInfoController extends GetxController {
  RxBool isloadin = false.obs;
  Future updateprofile() async {
    isloadin.value = true;
    try {
      final response = ApiService.patch(
        endpoint: ApiConfig.updateprofile,
        body: {
          "name": "Test",
          "bio": "bla bla bla",
          "profession": "xyz",
          "nationality": "Indian",
          "instagram": "instagram-link",
          "linkedIn": "linkedIn-link",
        },
      );
      print('response $response');
      Get.snackbar('Success', 'Congratulations profile updated successfully');
    } on AppException catch (e) {
      Get.snackbar('Updating profile failed ', e.toString());
    }
    finally{
      isloadin.value=false;
    }
  }
}
