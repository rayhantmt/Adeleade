import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mementum/utils/app_colors.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF2ED),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity,),
           Text(
                "Momentum",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                  color: Color(0xff1E1E1E),
                ),
              ),
              Text('Forgot password',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 26,
                color: Colors.black
              ),
              ),
              Text('Enter your email account to reset  your password',
              maxLines: 6,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xff7D848D)
              ),
              ),
              SizedBox(height: Get.height * 0.033),
                      Container(
                        height: Get.height * 0.07,
                        width: Get.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(99),
                          color: AppColors.primarycolor,
                        ),
                        child: Center(
                          child: Text(
                            'Forgot password',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
        ],
      ),
    );
  }
}