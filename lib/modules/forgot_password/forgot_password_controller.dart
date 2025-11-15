import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mementum/api/api_config.dart';
import 'package:mementum/api/api_services.dart';
import 'package:mementum/core/exceptions.dart';
RxBool isLoading= false.obs;
final emailController=TextEditingController();
class ForgotPasswordController extends GetxController{
  Future<void> submitEmail() async {
    isLoading.value = true;

    final body = {
      "data": {
        "email": emailController.text.trim(),
      }
    };

    try {
      final response = await ApiService.post(
        endpoint: ApiConfig.forgotpasswordendpoint, // Replace with your actual endpoint
        body: body,
      );

      // ✅ Handle success
      print("Response: $response");
      Get.snackbar('Success', 'Email submitted successfully',
        backgroundColor: Colors.green, colorText: Colors.white);

       Get.toNamed('/otp',arguments: emailController.text.trim());
      
    } on AppException catch (e) {
      // ❌ Error from API
      Get.snackbar('Error', e.message,
        backgroundColor: Colors.redAccent, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}