import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/modules/home/home_controller.dart';
import 'package:mementum/routes/app_pages.dart';
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
                          child: GestureDetector(
                            onTap: () => Get.toNamed(
                              AppPages.eventdetails,
                              arguments: {
                                'image': data.image,
                                'tittle': data.title,
                                'location': data.location,
                                'time': data.formattedDate,
                                'joinedpeople': data.joinedPeople,
                                'eventDeatils':data.details,
                                'hostedby':data.organizerName,
                                'hostphotourl':data.organizerPhoto,
                                'maxpeople':data.maxPeople
                              },
                            ),
                            child: Container(
                              height: Get.height * 0.2,
                              decoration: BoxDecoration(
                                color: Colors.white,
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
                                    child: Stack(
                                      children: [
                                        Image.network(
                                          data.image,
                                          height: Get.height * 0.1,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                        right: 5,

                                                        top: 5,
                                                      ),
                                                  child: Container(
                                                    height: Get.height * 0.025,
                                                    width: Get.width * 0.14,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            99,
                                                          ),
                                                      color: Colors.white,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                          AppImages.personlogo,
                                                          height:
                                                              Get.height * 0.02,
                                                          width:
                                                              Get.width * 0.04,
                                                        ),
                                                        Text(
                                                          '${data.joinedPeople}/${data.maxPeople}',
                                                          style:
                                                              GoogleFonts.inter(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 14,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 7),
                                    child: Text(
                                      data.title,
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
                                        Text(
                                          data.title,
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
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
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