import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/utils/app_images.dart';

class SubscriptionScreenView extends StatelessWidget {
  const SubscriptionScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.background,
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
                            'Subscription',
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
                  SizedBox(height: Get.height * 0.07),
                  Row(
                    children: [
                      SizedBox(width: Get.width * 0.15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Upgrade To Premium',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                AppImages.subscription_screen_img,
                                height: Get.height * 0.03,
                                width: Get.height * 0.03,
                              ),
                              Text('Unlimited Memories Created'),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                AppImages.subscription_screen_img,
                                height: Get.height * 0.03,
                                width: Get.height * 0.03,
                              ),
                              Text('Unlimited Memories Created'),
                            ],
                          ),
                        ],
                      ),
                    ],
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
