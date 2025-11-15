import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mementum/api/api_config.dart';
import 'package:mementum/api/api_services.dart';
import 'package:mementum/core/exceptions.dart';
import 'package:mementum/routes/app_pages.dart';

class LogInController extends GetxController {
  RxBool isObscured = false.obs;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  void toggleObscureText() {
    isObscured.value = !isObscured.value;
  }

  var isChecked = false.obs;

  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
  }

  RxBool isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;

    final body = {
      "email": emailcontroller.text.trim(),
      "password": passwordcontroller.text.trim(),
    };

    try {
      final response = await ApiService.post(
        endpoint: ApiConfig.loginEndpoint, // Change if your endpoint differs
        body: body,
      );
      final storage = GetStorage();
      final accessToken =
          response['data']['accessToken']; // <- from your response

      storage.write('token', accessToken);
      Get.offAllNamed(AppPages.mainscreen);
      // Handle success (e.g., token saving, navigating)
      //print("Login success: $response");
    } on AppException catch (e) {
      Get.snackbar("Login Failed", e.message);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.onClose();
  }
}
