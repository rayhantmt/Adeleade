import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mementum/api/api_config.dart';
import 'package:mementum/api/api_services.dart';
import 'package:mementum/core/exceptions.dart';
import 'package:mementum/routes/app_pages.dart';

class OtpController extends GetxController {
  final otpController = TextEditingController();
  RxString otp = ''.obs;
  RxBool isButtonEnabled = false.obs;
  RxInt secondsRemaining = 60.obs;
  Timer? timer;
 
  final isLoading = false.obs; 

  // For 6 separate OTP fields
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> otpFocusNodes = List.generate(6, (_) => FocusNode());

  @override
  void onInit() {
    super.onInit();
    startTimer();
    for (var i = 0; i < 6; i++) {
      otpControllers[i].addListener(() {
        otp.value = otpControllers.map((c) => c.text).join();
        isButtonEnabled.value = otp.value.length == 6;
      });
    }
  }

  void startTimer() {
    secondsRemaining.value = 60;
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (secondsRemaining.value == 0) {
        t.cancel();
      } else {
        secondsRemaining.value--;
      }
    });
  }

  void resendCode() {
    if (secondsRemaining.value == 0) {
      startTimer();
      Get.snackbar("OTP", "New OTP sent");
    }
  }

  // void verifyOtp() {
  //   if (otp.value.length == 6) {
  //     // Simulate API call
  //     Get.snackbar("OTP Verified", "Proceeding to next step...");
  //   }
  // }

  void onOtpFieldChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      otpFocusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      otpFocusNodes[index - 1].requestFocus();
    }
    otp.value = otpControllers.map((c) => c.text).join();
    isButtonEnabled.value = otp.value.length == 6;
  }
  final email=Get.arguments;
Future<void> verifyOtp() async {
  final body = {
    "email": email,
    "otp": otp.value
  };

  isLoading.value = true; // Start loading
  try {
    final response = await ApiService.post(
      endpoint: ApiConfig.verifyOtpendpoint,
      body: body,
    );
 //final userId = response['data']['user']['id'];
 
    print("OTP Verification Success: $response");
    Get.toNamed(AppPages.updatepassword,arguments: email );//arguments: {'userId': userId});
  } on AppException catch (e) {
    Get.snackbar(
      'Verification Failed',
      e.message,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
    );
  } finally {
    isLoading.value = false; // Stop loading
  }
}

  @override
  void onClose() {
    timer?.cancel();
    for (final c in otpControllers) {
      c.dispose();
    }
    for (final f in otpFocusNodes) {
      f.dispose();
    }
    super.onClose();
//   }Future<void> verifyOtp() async {
//   final body = {
//     "data": {"email": email, "otp": otp.value},
//   };

//   isLoading.value = true; // Start loading
//   try {
//     final response = await ApiService.post(
//       endpoint: ApiConfig.otpendpoint,
//       body: body,
//     );
//  final userId = response['data']['user']['id'];
 
//     print("OTP Verification Success: $response");
//     Get.toNamed(Approutes.changepassword, arguments: {'userId': userId});
//   } on AppException catch (e) {
//     Get.snackbar(
//       'Verification Failed',
//       e.message,
//       backgroundColor: Colors.redAccent,
//       colorText: Colors.white,
//     );
//   } finally {
//     isLoading.value = false; // Stop loading
//   }
// }

//   @override
//   void onClose() {
//     timer?.cancel();
//     for (final c in otpControllers) {
//       c.dispose();
//     }
//     for (final f in otpFocusNodes) {
//       f.dispose();
//     }
//     super.onClose();
//   }

}
}