import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/modules/event_details/event_details_controller.dart';
import 'package:mementum/routes/app_pages.dart';
import 'package:mementum/utils/app_colors.dart';
import 'package:mementum/utils/app_images.dart';

class EventDetails extends GetView<EventDetailsController> {
  const EventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final data = controller.ppl;
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(''),
      // ),
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
                    Image.network(
                      controller.image,
                      height: Get.height * 0.35,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          height: Get.height * 0.35,
                          width: double.infinity,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      },
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20,top: 40),
                              child: GestureDetector(
                                onTap: () => Get.back(),
                                child: Icon(Icons.arrow_back,
                                size: 35,
                                color: AppColors.primarycolor,
                                ),
                              ),
                            ),
                            Spacer(),
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
                                    Text(
                                      '${controller.joinedPeople}/${controller.maxpeople}',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Color(0xff1E1E1E),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        
                        SizedBox(height: Get.height * 0.22),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: Get.height * 0.02),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        controller.tittle,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
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
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color(0xff1E1E1E),
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
                SizedBox(height: Get.height * 0.02),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Location',
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
                          Expanded(
                            child: Text(
                              controller.location.toString(),
                              overflow: TextOverflow.ellipsis,

                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xff898989),
                              ),
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
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color(0xff1E1E1E),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            controller.details.toUpperCase(),
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
                      GestureDetector(
                        onTap: () =>  Get.toNamed(AppPages.profile_details,arguments: {
                          'id':controller.hostid
                        }),
                        child: Row(
                          children: [
                            Container(
                              height: Get.height * 0.07,
                              width: Get.width * 0.15,
                              child: ClipOval(
                                //borderRadius: BorderRadiusGeometry.circular(200),
                               
                                child: Image.network(
                                  controller.hostphoto.toString(),
                                  fit: BoxFit.cover,
                                  height: Get.height * 0.1,
                                  width: Get.width * 0.1,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                        if (loadingProgress == null) return child;
                                        return Container(
                                          height: Get.height * 0.1,
                                          width: Get.width * 0.2,
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      },
                                ),
                              ),
                            ),
                            SizedBox(width: Get.width * 0.05),
                            Text(
                              controller.host.toString().toUpperCase(),
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff1E1E1E),
                              ),
                            ),
                          ],
                        ),
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
                      Container(
                        height: Get.height * 0.07,
                        //this height to adjust the circle size
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          itemBuilder: (context, index) => Container(
                            //height: Get.height * 0.01,
                            //this width to adjust the circle size
                            width: Get.width * 0.15,
                            child: ClipOval(
                            
                              child: GestureDetector(
                                onTap: () => Get.toNamed(
                                  AppPages.profile_details,
                                  arguments: {'id': data[index].id},
                                ),
                                child: Image.network(
                                  data[index].photoURL,

                                  fit: BoxFit.cover,
                                  // height: Get.height * 0.05,
                                  // width: Get.width * 0.11,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Container(
                                          height: Get.height * 0.1,
                                          width: Get.width * 0.2,
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.02),
                      GestureDetector(
                        onTap: () => controller.joinEvent(),
                        child: Container(
                          height: Get.height * 0.07,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            color: AppColors.primarycolor,
                          ),
                          child: Center(
                            child: Obx(
                              () => controller.isLoading.value
                                  ? CircularProgressIndicator(
                                      color: Colors.black,
                                    )
                                  : Text(
                                      'Join',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Color(0xff1E1E1E),
                                      ),
                                    ),
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
