import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/routes/app_pages.dart';
import 'package:mementum/utils/app_images.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.background,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                  height: Get.height * 0.07,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentGeometry.centerLeft,
                        child: Image.asset(
                          AppImages.back_icon,
                          height: Get.height * 0.07,
                          width: Get.height * 0.07,
                        ),
                      ),
                      Center(
                        child: Text(
                          'My Profile',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),  
                SizedBox(height: Get.height*0.2,),
                Image.asset(AppImages.notification_img),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}