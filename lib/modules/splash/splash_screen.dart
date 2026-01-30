import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/routes/app_pages.dart';
import 'package:mementum/utils/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.amination,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: double.infinity),
             
              // Text(
              //   "Momentum",
              //   style: GoogleFonts.robotoSlab(
              //     fontWeight: FontWeight.w700,
              //     fontSize: 32,
              //     color: Color(0xff1E1E1E),
              //   ),
              // ),
              SizedBox(height: Get.height*0.2),
              GestureDetector(
                onTap: () => Get.toNamed(AppPages.signup),
                child: Container(
                  height: 60,
                  width: Get.width*0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
                    color: Color(0xffDACBA4),
                  ),
                  child: Center(
                    child: Text(
                      'Request an invite',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height*0.03),
              GestureDetector(
                onTap: () => Get.toNamed(AppPages.login),
                child: Container(
                  height: 60,
                  width: Get.width*0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}