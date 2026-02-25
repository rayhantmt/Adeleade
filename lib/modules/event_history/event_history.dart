import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/routes/app_pages.dart';
import 'package:mementum/utils/app_colors.dart';
import 'package:mementum/utils/app_images.dart';

class EventHistory extends StatelessWidget {
  const EventHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.background,
            height: double.infinity,
            width: double.infinity,
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
                          child: GestureDetector(
                            onTap: () => Get.back(),
                            child: Image.asset(
                              AppImages.back_icon,
                              height: Get.height * 0.07,
                              width: Get.height * 0.07,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Event Created Successfully',
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

              SizedBox(height: Get.height*0.3,),
                GestureDetector(
                  onTap: () => Get.toNamed(AppPages.mainscreen),
                  child: Container(
                    height: Get.height*0.05,
                    width: Get.width*0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      color: AppColors.primarycolor
                    ),
                    child: Center(
                      child: Text('Go to home page',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.white
                      ),
                      ),
                    ),
                  ),
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
