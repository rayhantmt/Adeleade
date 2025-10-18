import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
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
        )
      ],
     ),
    );
  }
}