import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mementum/common_widgets/textfield.dart';
import 'package:mementum/modules/request_an_invite_second/request_an_invite_second_controller.dart';
import 'package:mementum/utils/app_colors.dart';
import 'package:mementum/utils/app_images.dart';

class RequestAnInviteSecond extends GetView<RequestAnInviteSecondController> {
  const RequestAnInviteSecond({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    controller.name = args['name'];
    controller.email = args['email'];
    controller.gender = args['gender'];
    controller.age = args['age'];
    controller.profession = args['profession'];
    controller.nationality = args['nationality'];
    controller.instagram = args['instagram'];
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.amination,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Get.height * 0.1),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    height: Get.height * 0.9,
                    width: Get.width * 0.9,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: Get.height * 0.02),
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColors.primarycolor,
                          ),
                        ),
                        Text(
                          'Request an invite',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 26,
                            color: AppColors.primarycolor,
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        Text(
                          'Create an account or log in to explore our app',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xff6C7278),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        GestureDetector(
                          onTap: controller.pickCoverImage,
                          child: Obx(
                            () => controller.coverImage.value != null
                                ? Image.file(
                                    height: Get.height * 0.03,
                                    width: Get.width * 0.7,
                                    File(controller.coverImage.value!.path),
                                  )
                                : Container(
                                    height: Get.height * 0.03,
                                    width: Get.width * 0.7,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text('Select Cover Image'),
                                  ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        GestureDetector(
                          onTap: controller.pickProfileImage,
                          child: Obx(
                            () => controller.profileImage.value != null
                                ? Image.file(
                                    height: Get.height * 0.08,
                                    width: Get.width * 0.7,
                                    File(controller.profileImage.value!.path),
                                  )
                                : Container(
                                    height: Get.height * 0.06,
                                    width: Get.width * 0.7,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text('Select profile image'),
                                    ),
                                  ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.1),
                          child: Row(children: [Text('LinkedIn')]),
                        ),
                        Commontextfield(
                          tittle: 'Link of your LinkedIn profile',
                          obsecuretext: false,
                          textcontroller: controller.linkedincontroller,
                        ),
                        SizedBox(height: Get.height * 0.02),
                        Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.1),
                          child: Row(children: [Text('Bio')]),
                        ),
                        Commontextfield(
                          tittle: 'Describe yourself in a short description',
                          obsecuretext: false,
                          textcontroller: controller.biocontroller,
                        ),
                        SizedBox(height: Get.height * 0.02),
                        Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.1),
                          child: Row(children: [Text('Upload 5 images')]),
                        ),
                        GestureDetector(
                          onTap: controller.pickImages,
                          child: Obx(
                            () => controller.selectedImages.isNotEmpty
                                ? Container(
                                    height: Get.height * 0.07,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          controller.selectedImages.length,
                                      itemBuilder: (context, index) {
                                        final img =
                                            controller.selectedImages[index];
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.file(
                                            File(img.path),
                                            height: Get.height * 0.1,
                                            // width: Get.width*0.01,
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : Container(
                                    height: Get.height * 0.05,
                                    width: Get.width * 0.7,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.1),
                          child: Row(children: [Text('Password')]),
                        ),
                        Obx(
                          () => Commontextfield(
                            tittle: '*******',
                            obsecuretext: controller.isObscured.value,
                            textcontroller: controller.passwordcontroller,
                            icon: GestureDetector(
                              onTap: controller.toggleObscureText,
                              child: controller.isObscured.value
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.1),
                          child: Row(children: [Text('Confirm Password')]),
                        ),
                        Obx(
                          () => Commontextfield(
                            tittle: '*******',
                            obsecuretext: controller.isObscured1.value,
                            icon: GestureDetector(
                              onTap: controller.toggleObscureText1,
                              child: controller.isObscured1.value
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.015),
                        GestureDetector(
                          onTap: controller.createUser,
                          child: Container(
                            height: Get.height * 0.07,
                            width: Get.width * 0.7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(99),
                              color: AppColors.primarycolor,
                            ),
                            child: Center(
                              child: Obx(
                                () => controller.isLoading.value
                                    ? CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        'Request an invite',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
