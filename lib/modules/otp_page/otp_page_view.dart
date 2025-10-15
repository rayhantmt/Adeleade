import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:mementum/modules/otp_page/otp_page_controller.dart';
import 'package:mementum/routes/app_pages.dart';
import 'package:mementum/utils/app_colors.dart';
import 'package:mementum/utils/app_images.dart';

class OtpPageView extends GetView<OtpController> {
  const OtpPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xffFAF2ED),
      body: Stack(
        
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset(
                      AppImages.back_icon,
                      height: Get.height * 0.07,
                      width: Get.height * 0.07,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                      "Momentum",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.033),
                const Text(
                  "Verify your email",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff050505),
                  ),
                ),
                const SizedBox(height: 12),
               
                const SizedBox(height: 4),
                 Text(
                  "Please enter the verification code we sent to your email address to complete the verification process.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff595959),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return SizedBox(
                      width: 40,
                      child: TextField(
                        controller: controller.otpControllers[index],
                        focusNode: controller.otpFocusNodes[index],
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: const InputDecoration(
                          counterText: '',
                          border: UnderlineInputBorder(),
                        ),
                        onChanged: (value) {
                          controller.onOtpFieldChanged(value, index);
                        },
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 16),
                Obx(() => GestureDetector(
                      onTap: controller.secondsRemaining.value == 0
                          ? controller.resendCode
                          : null,
                      child: Text(
                        controller.secondsRemaining.value == 0
                            ? "Resend code"
                            : "Resend code ${controller.secondsRemaining}s",
                        style: TextStyle(
                          color: controller.secondsRemaining.value == 0
                              ? const Color(0xFF1B1E28)
                              : const Color(0xFF7D848D),
                        ),
                      ),
                    )),
                const SizedBox(height: 32),
                 GestureDetector(
                  onTap: () => Get.toNamed(AppPages.updatepassword),
                   child: Container(
                              height: Get.height * 0.07,
                              width: Get.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(99),
                                color: AppColors.primarycolor,
                              ),
                              child: Center(
                                child: Text(
                                  'Verify',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                 ),
               ],
            ),
          ),
        ],
      ),
    );
  }
}