import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mementum/modules/event_details/event_details_controller.dart';
import 'package:mementum/utils/app_colors.dart';
import 'package:mementum/utils/app_images.dart';

class EventDetails extends GetView<EventDetailsController> {
  const EventDetails({super.key});

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
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      controller.image,
                      height: Get.height * 0.35,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 20,
                                top: 40,
                              ),
                              child: Container(
                                height: Get.height * 0.04,
                                width: Get.width * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      AppImages.personlogo,
                                      height: Get.height * 0.03,
                                      width: Get.width * 0.1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.22),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            controller.tittle,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: Get.height * 0.02),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            
                            'Date and time                                         ',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xff898989),
                              
                            ),
                          ),
                          Text(
                            controller.time,
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
                ),
                SizedBox(height: Get.height*0.02,),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Location",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color(0xff1E1E1E),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Dhaka,Bangladesh',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xff898989),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * 0.015),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'About this activity',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xff1E1E1E),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Join us for an afternoon of golf combined with meaningful business networking. Perfect for professionals looking to expand',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xff898989),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * 0.01),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Hosted by',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color(0xff1E1E1E),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: Get.height * 0.1,
                            width: Get.width * 0.2,
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(200),
                              child: Image.asset(
                                AppImages.profilephoto,
                                fit: BoxFit.cover,
                                height: Get.height * 0.1,
                                width: Get.width * 0.2,
                              ),
                            ),
                          ),
                          SizedBox(width: Get.width * 0.05),
                          Text(
                            'Mostafa Rahma',
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
                ),
               // SizedBox(height: Get.height * 0.1),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Who's Going (1)",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color(0xff1E1E1E),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: Get.height * 0.1,
                              width: Get.width * 0.2,
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(
                                  200,
                                ),
                                child: Image.asset(
                                  AppImages.profilephoto,
                                  fit: BoxFit.cover,
                                  height: Get.height * 0.1,
                                  width: Get.width * 0.2,
                                ),
                              ),
                            ),
                            Container(
                              height: Get.height * 0.1,
                              width: Get.width * 0.2,
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(
                                  200,
                                ),
                                child: Image.asset(
                                  AppImages.profilephoto,
                                  fit: BoxFit.cover,
                                  height: Get.height * 0.1,
                                  width: Get.width * 0.2,
                                ),
                              ),
                            ),
                            Container(
                              height: Get.height * 0.1,
                              width: Get.width * 0.2,
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(
                                  200,
                                ),
                                child: Image.asset(
                                  AppImages.profilephoto,
                                  fit: BoxFit.cover,
                                  height: Get.height * 0.1,
                                  width: Get.width * 0.2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Container(
                        height: Get.height * 0.07,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(99),
                          color: AppColors.primarycolor,
                        ),
                        child: Center(
                          child: Text(
                            'Join',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xff1E1E1E),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * 0.2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
