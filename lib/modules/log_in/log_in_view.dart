import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mementum/utils/app_images.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.amination,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: Get.height*0.7,
                width: Get.width*0.9,
                color: Colors.white,
              )
            ],
          )
        ],
      ),
    );
  }
}