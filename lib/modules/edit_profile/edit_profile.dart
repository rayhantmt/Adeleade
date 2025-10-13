import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/utils/app_images.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.background),
          SafeArea(child: 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
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
                          'Edit Profile',
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
                SizedBox(height: Get.height*0.02,),
                Stack(
                   
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(6),
                      child: Image.asset(AppImages.profilephoto
                      )),
                      Align(
                        alignment: AlignmentGeometry.center,
                        child: CircleAvatar(
                          child: Image.asset(AppImages.profilephoto),
                        ),
                      )
                  ],
                )
              ],
            ),
          )
          )
        ],
      ),
    );
  }
}