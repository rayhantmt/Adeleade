import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mementum/modules/chat_details/chat_details_controller.dart';
import 'package:mementum/utils/app_images.dart';

class ChatDetailsView extends GetView<ChatDetailsController> {
  const ChatDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(99),
              child: Image.asset(
                controller.img,
                height: Get.height * 0.1,
                width: Get.width * 0.1,
              ),
            ),
            Text(controller.name),
          ],
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset(
            AppImages.background,
            height: double.infinity,
            width: double.infinity,

            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
