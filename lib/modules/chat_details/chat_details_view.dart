import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mementum/utils/app_images.dart';

class ChatDetailsView extends StatelessWidget {
  const ChatDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    String image = arguments['imgae'];
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.background,
            height: double.infinity,
            width: double.infinity,

            fit: BoxFit.cover,
          ),
          Center(
            child: Image.asset(image,
            height: 200,
            width: 200,
            ),
          )
        ],
      ),
    );
  }
}
