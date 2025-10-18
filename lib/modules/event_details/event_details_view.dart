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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: Get.height*0.32,),
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