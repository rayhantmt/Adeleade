import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mementum/routes/app_pages.dart';
import 'package:mementum/utils/app_colors.dart';

class UpdatePasswordSuccessfull extends StatelessWidget {
  const UpdatePasswordSuccessfull({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xffFAF2ED),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: double.infinity,),
             Text(
                  "Momentum",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: AppColors.primarycolor,
                  ),
                ),
                SizedBox(height: Get.height * 0.033),
                Text('Congratulations',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                  color: Colors.black
                ),
                ),
                 SizedBox(height: Get.height * 0.033),
                 Text('Your password has been successfully reset',
                 style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff7D848D)
                 ),
                 ),
                  SizedBox(height: Get.height * 0.02),
                      
                     
                      SizedBox(height: Get.height * 0.033),
                      GestureDetector(
                        onTap: () => Get.offAllNamed(AppPages.login),
                        child: Container(
                          height: Get.height * 0.07,
                          width: Get.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            color: AppColors.primarycolor,
                          ),
                          child: Center(
                            child: Text(
                              'Log in',
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
    );
  }
}