import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/modules/profile_details/profile_controller.dart';
import 'package:mementum/utils/app_colors.dart';
import 'package:mementum/utils/app_images.dart';

class ProfileDetails extends GetView<ProfileController> {
  const ProfileDetails({super.key});

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
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
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
                    SizedBox(height: Get.height * 0.25,
                    child: Image.asset(AppImages.profilephoto),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImages.instagram_logo,
                          height: Get.height * 0.1,
                          width: Get.width * 0.1,
                        ),
                        SizedBox(width: Get.width * 0.05),
                        Image.asset(
                          AppImages.linked_in_logo,
                          height: Get.height * 0.1,
                          width: Get.width * 0.1,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Age',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff898989),
                              ),
                            ),
                            Text(
                              '25',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff1E1E1E),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'gender',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff898989),
                              ),
                            ),
                            Text(
                              controller.id.toString(),
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff1E1E1E),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Nationality',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff898989),
                              ),
                            ),
                            Text(
                              'Bangladeshi',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff1E1E1E),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: Get.height * 0.05,
                          width: Get.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            color: AppColors.primarycolor,
                          ),
                          child: Center(
                            child: Text(
                              'Connect',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

                        Container(
                          height: Get.height * 0.05,
                          width: Get.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            color: AppColors.primarycolor,
                          ),
                          child: Center(
                            child: Text(
                              'Chat',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bio',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff1E1E1E),
                          ),
                        ),
                        Text(
                          'Join us for an afternoon of golf combined with meaningful business networking. Perfect for professionals looking to expand',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff898989),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        Text(
                          'Galley',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color(0xff1E1E1E),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        SizedBox(
                          height: Get.height * 0.2,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.gallery.length,
                            itemBuilder: (context, index) {
                              final data = controller.gallery[index];
                              return Container(
                                height: Get.height * 0.2,
                                width: Get.width * 0.2,
                                child: Image.asset(data.image),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
