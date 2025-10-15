import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mementum/common_widgets/textfield.dart';
import 'package:mementum/routes/app_pages.dart';
import 'package:mementum/utils/app_colors.dart';
import 'package:mementum/utils/app_images.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF2ED),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
              
                children: [
                  Image.asset(
                    AppImages.back_icon,
                    height: Get.height * 0.07,
                    width: Get.height * 0.07,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: double.infinity),
                Text(
                  "Momentum",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: Get.height * 0.033),
                Text(
                  'Forgot password',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: Get.height * 0.033),
                Text(
                  'Enter your email account to reset  your password',
                  maxLines: 6,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff7D848D),
                  ),
                ),
                SizedBox(height: Get.height * 0.033),

                Padding(
                  padding: EdgeInsets.only(left: Get.width * 0.1),
                  child: Row(children: [Text('Email')]),
                ),
                SizedBox(height: Get.height * 0.01),
                Commontextfield(
                  tittle: 'Rayhantmt@gmail.com',
                  obsecuretext: false,
                ),
                SizedBox(height: Get.height * 0.033),
                GestureDetector(
                  onTap: () => Get.toNamed(AppPages.otppage),
                  child: Container(
                    height: Get.height * 0.07,
                    width: Get.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      color: AppColors.primarycolor,
                    ),
                    child: Center(
                      child: Text(
                        'Send otp',
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
