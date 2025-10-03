import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mementum/utils/app_colors.dart';
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
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: Get.height*0.7,
                  width: Get.width*0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
SizedBox(height: Get.height*0.01,),
Text('Log In',
style: TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 26,
color: AppColors.primarycolor
),
)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}