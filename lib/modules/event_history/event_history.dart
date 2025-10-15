import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/modules/home/home_controller.dart';
import 'package:mementum/utils/app_images.dart';

class EventHistory extends StatelessWidget {
  const EventHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.find<HomeController>();
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
                                'Event History',
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

                       Expanded(
                  child: Obx(
                    () => GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: controller.events.length,

                      itemBuilder: (context, index) {
                        final data = controller.events[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: Get.height * 0.2,
                            decoration: BoxDecoration(
                              color: Color(0xffF4EFE3B2).withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadiusGeometry.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  child: Image.asset(
                                    data.image,
                                    height: Get.height * 0.1,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                               // SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.only(left: 7),
                                  child: Text(
                                    data.tittle,
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 7),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        AppImages.calander_icon,
                                        height: Get.height * 0.03,
                                        width: Get.width * 0.05,
                                      ),
                                     // SizedBox(width: Get.width * 0.01),
                                      Text(
                                        data.date_time,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Color(0xff898989),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 7),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        AppImages.location_icon,
                                        height: Get.height * 0.03,
                                        width: Get.width * 0.05,
                                      ),
                                      SizedBox(width: Get.width * 0.01),
                                      Text(
                                        data.location,

                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Color(0xff898989),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                 ],
               ),
             ),
           ),
        ],
      ),
    );
  }
}