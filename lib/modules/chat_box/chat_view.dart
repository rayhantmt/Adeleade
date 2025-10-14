import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/modules/chat_box/chat_controller.dart';
import 'package:mementum/utils/app_images.dart';

class HistoryView extends GetView<ChatController> {
  const HistoryView({super.key});

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
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
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
                            'Chatbox',
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
                ),
              ),
          
              Expanded(
                child: Container(
                  color: Colors.white,
                  height: double.infinity,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: controller.conversations.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          height: Get.height * 0.05,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Text(
                            controller.conversations[index].name,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
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
