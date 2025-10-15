import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/modules/chat_box/chat_controller.dart';
import 'package:mementum/utils/app_images.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

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
                    padding: EdgeInsets.only(top: 0,bottom: 0,left: 20,right: 20),
                    itemCount: controller.conversations.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          height: Get.height * 0.05,
                          width: double.infinity,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(100),
                                child: Image.asset(controller.conversations[index].image),
                              ),
                              SizedBox(width: Get.width*0.01,),
                              Container(
                                width: Get.width*0.6,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.conversations[index].name,
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(controller.conversations[index].msg,
                                    overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ),
                             // Spacer(),
                              Expanded(
                                child: Text(controller.conversations[index].time,
                                textAlign: TextAlign.end,
                                maxLines: 1,
                                ),
                              )
                            ],
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
