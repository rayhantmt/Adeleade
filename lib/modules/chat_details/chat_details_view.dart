import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/modules/chat_details/chat_details_controller.dart';
import 'package:mementum/utils/app_images.dart';

class ChatDetailsView extends GetView<ChatDetailsController> {
  const ChatDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(999),
              child: Image.network(
                controller.img,
                height: Get.height * 0.1,
                width: Get.width * 0.1,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: Get.width*0.04,),
            Text(controller.name.toUpperCase()),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: Get.height * 0.75,
            width: double.infinity,
            child: ListView.builder(
              reverse: true,
              itemCount: controller.msgs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20,
                  right: 20
                  ),
                  child: Column(
                    crossAxisAlignment: controller.msgs[index].isme == false
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      Text(
                        controller.msgs[index].name,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xff000E08),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(controller.msgs[index].msg,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 12
                        ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            height: Get.height * 0.1,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Image.asset(
                    AppImages.attachfile_logo,
                    height: Get.height * 0.05,
                    width: Get.width * 0.1,
                  ),
                  Container(
                    height: Get.height * 0.1,
                    width: Get.width * 0.6,
                    decoration: BoxDecoration(),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hint: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Write your message'),
                            Image.asset(
                              AppImages.message_input_logo,
                              height: Get.height * 0.03,
                              width: Get.width * 0.1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    AppImages.cameralogo,
                    height: Get.height * 0.05,
                    width: Get.width * 0.08,
                  ),
                  Image.asset(
                    AppImages.microphone_logo,
                    height: Get.height * 0.035,
                    width: Get.width * 0.1,
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
