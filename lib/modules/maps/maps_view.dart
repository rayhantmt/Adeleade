import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/utils/app_images.dart';

class MapsView extends StatelessWidget {
  const MapsView({super.key});

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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
               
                children: [
                  SizedBox(height: Get.height*0.02,width: double.infinity,),
                  Text('Maps Events',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black
                  ),
                  ),
                  Text('Events Happening Near you',textAlign: TextAlign.center,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}