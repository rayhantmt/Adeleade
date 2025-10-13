import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/modules/memories/memories_controller.dart';
import 'package:mementum/utils/app_colors.dart';
import 'package:mementum/utils/app_images.dart';


class MemoriesView extends GetView<MemoriesController> {
  const MemoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F7F1),
      body: SafeArea(
        child: SingleChildScrollView(
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
                            'Memories',
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
                  SizedBox(height: Get.height*0.01,),
                  Obx(() => 
                  Row(
                    children: [
                        Expanded(
                            child: GestureDetector(
                              onTap: () => controller.setDepositType(0),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: controller.memorytype.value == 0
                                      ? AppColors.primarycolor
                                      : Color(0xffE7F0EB),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    "On-Time",
                                    style: TextStyle(
                                      color: controller.memorytype.value == 0
                                          ? Colors.white
                                          : Color(0xff126535),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => controller.setDepositType(1),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: controller.memorytype.value == 1
                                      ? AppColors.primarycolor
                                      : Color(0xffE7F0EB),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    "Recurring Deposit",
                                    style: TextStyle(
                                      color: controller.memorytype.value == 1
                                          ? Colors.white
                                          : Color(0xff126535),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                    ],
                  )
                  
                  
                  ,)
              ],
            ),
          ),
        ),
      )
    );
  }
}