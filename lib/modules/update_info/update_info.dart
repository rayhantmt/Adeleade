import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/common_widgets/update_info_field.dart';
import 'package:mementum/modules/update_info/update_info_controller.dart';
import 'package:mementum/utils/app_colors.dart';
import 'package:mementum/utils/app_images.dart';

class UpdateInfoView extends GetView<UpdateInfoController> {
  const UpdateInfoView({super.key});

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
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.07,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentGeometry.centerLeft,
                            child: GestureDetector(
                              onTap: () => Get.back(),
                              child: Image.asset(
                                AppImages.back_icon,
                                height: Get.height * 0.07,
                                width: Get.height * 0.07,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Update Info',
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
                    SizedBox(height: Get.height * 0.02),
                    UpdateInfoField(tittle: 'Name', hint: 'Enter your new name',textcontroller: controller.namecontroller,),
                    SizedBox(height: Get.height * 0.02),
                    UpdateInfoField(tittle: 'Bio', hint: 'Enter your new bio',textcontroller: controller.biocontroller,),
                    SizedBox(height: Get.height * 0.02),
                    UpdateInfoField(
                      tittle: 'Profession',
                      hint: 'Enter your new profession',textcontroller: controller.professioncontroller,
                    ),
                    SizedBox(height: Get.height * 0.02),
                    UpdateInfoField(tittle: 'Nationality', hint: 'Enter your new nationality',textcontroller: controller.nationalitycontroller,),
                    SizedBox(height: Get.height * 0.02),
                    UpdateInfoField(
                      tittle: 'Instagram',
                      hint: 'Enter your new instagram link',
                      textcontroller: controller.instagramcontroller,
                    ),
                    SizedBox(height: Get.height * 0.02),
                    UpdateInfoField(
                      tittle: 'Linkedin',
                      hint: 'Enter your linkedin link',
                      textcontroller: controller.linkedincontroller,
                    ),
                    // SizedBox(height: Get.height * 0.02),
                    // UpdateInfoField(
                    //   tittle: 'Linkedin',
                    //   hint: 'Enter your Linkedin link',
                    // ),
                    // SizedBox(height: Get.height * 0.02),
                    // UpdateInfoField(tittle: 'Bio', hint: 'Enter your bio'),
                    SizedBox(height: Get.height * 0.02),
                    GestureDetector(
                        onTap: () => print('Balchal'),
                        child: Container(
                          height: Get.height * 0.07,
                          width: Get.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            color: AppColors.primarycolor,
                          ),
                          child: Center(
                            child: Text(
                              'Update your profile info',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                     
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
