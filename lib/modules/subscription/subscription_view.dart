import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/utils/app_images.dart';

class SubscriptionView extends StatelessWidget {
  const SubscriptionView({super.key});

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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: double.infinity),
              Container(
                height: Get.height * 0.6,
                width: Get.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Image.asset(AppImages.logo, height: Get.height * 0.07),
                    Text(
                      '    Quality over \nquantity, always',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.04),
                    Text(
                      "Join Momentum's founding circle\n         of exceptional people",

                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.03),
                    Divider(
                      height: 1,
                      indent: 20,
                      endIndent: 20,
                      color: Color(0xffDACBA4),
                    ),
                    SizedBox(height: Get.height * 0.03),
                    Container(
                      height: Get.height * 0.05,
                      width: Get.width * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xffDACBA4),
                      ),
                      child: Center(
                        child: Text(
                          'Secure founding Access for \$19',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height*0.03,),
                    Text("You'll be cahrged once.If accepted,\n          your access is lifetime")
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
