import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/utils/app_images.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.background,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
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
                                'Profile',
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
                      SizedBox(height: Get.height*0.25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.instagram_logo,
                          height: Get.height*0.1,
                          width: Get.width*0.1,
                          ),
                          SizedBox(width: Get.width*0.05,),
                          Image.asset(AppImages.linked_in_logo,
                          height: Get.height*0.1,
                          width: Get.width*0.1,
                          )
                        ],
                      )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}