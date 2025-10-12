import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/utils/app_images.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F7F1),
      body: SafeArea(
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
                      child: Text('My Profile',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.black
                      ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
