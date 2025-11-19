import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mementum/api/api_config.dart';
import 'package:mementum/api/api_services.dart';
import 'package:mementum/core/exceptions.dart';
import 'package:mementum/routes/app_pages.dart';

class UpdatePasswordController extends GetxController{


RxBool isObscured = false.obs;
final eamil=Get.arguments;
final passwordcontroller=TextEditingController();

  void toggleObscureText() {
    isObscured.value = !isObscured.value;
  }
  RxBool isObscured1 = false.obs;

  void toggleObscureText1() {
    isObscured1.value = !isObscured1.value;
  }
  RxBool isLoading = false.obs;

  Future<void> updatepassword() async {
    isLoading.value = true;

    final body = {
      "email": eamil,
      "newPassword": passwordcontroller.text.trim(),
    };

    try {
      final response = await ApiService.post(
        endpoint: ApiConfig.updatepassword, // Change if your endpoint differs
        body: body,
      );
      

   
      Get.toNamed(AppPages.updatePasswordSuccessfull);
      Get.snackbar("Update Password Successfull",'');
      print("Update Password success: $response");
    } on AppException catch (e) {
      Get.snackbar("Update Password Failed", e.message);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
   
    passwordcontroller.dispose();
    super.onClose();
  }

}