import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              borderRadius: BorderRadiusGeometry.circular(99),
              child: Image.asset(
                controller.img,
                height: Get.height * 0.1,
                width: Get.width * 0.1,
              ),
            ),
            Text(controller.name),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            children: [
             
              Image.asset(
                AppImages.background,
                height: double.infinity,
                width: double.infinity,
          
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  Container(
                    height: Get.height*0.9,
                    width: double.infinity,
                    color: Colors.blue,
                    child: Text('Messages'),
                  ),
                  Container(
                    height: Get.height*0.1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Row(
                        children: [
                          Image.asset(AppImages.attachfile_logo,
                          height: Get.height*0.05,
                          width: Get.width*0.1,
                          ),
                         Container(
                          height: Get.height*0.1,
                          width: Get.width*0.6,
                          decoration: BoxDecoration(
                            
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hint: Row(
                                children: [
                                Text('Write your message'),
                               
                                ],
                              )
                            ),
                          ),
                         ),
                          Image.asset(AppImages.cameralogo,
                          height: Get.height*0.05,
                          width: Get.width*0.1,
                          ), 
                          Image.asset(AppImages.microphone_logo,
                          height: Get.height*0.05,
                          width: Get.width*0.1,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            
            ],
          ),
        ],
      ),
      
    );
  }
}
