import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/utils/app_images.dart';

class SubscriptionScreenView extends StatelessWidget {
  const SubscriptionScreenView({super.key});

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
        ],
      ),
    );
  }
}