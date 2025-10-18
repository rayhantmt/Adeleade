import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mementum/modules/event_details/event_details_controller.dart';
import 'package:mementum/utils/app_images.dart';

class EventDetails extends GetView<EventDetailsController> {
  const EventDetails({super.key});

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
        SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(controller.image,
                  height: Get.height*0.35,
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
                            padding: const EdgeInsets.only(right: 20,top: 40),
                            child: Container(
                              height: Get.height*0.04,
                              width: Get.width*0.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white
                              ),
                              child: Row(children: [
Image.asset(AppImages.personlogo,
height: Get.height*0.03,
width: Get.width*0.1,
)
                              ],),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: Get.height*0.22,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(controller.tittle,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
     ),
    );
  }
}