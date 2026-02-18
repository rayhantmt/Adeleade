import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mementum/common_widgets/textfield.dart';
import 'package:mementum/modules/request_an_invite/request_an_invite_controller.dart';
import 'package:mementum/routes/app_pages.dart';
import 'package:mementum/utils/app_colors.dart';
import 'package:mementum/utils/app_images.dart';

class RequestAnInviteView extends GetView<RequestAnInviteController> {
  const RequestAnInviteView({super.key});
  @override
  Widget build(BuildContext context) {
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
                    height: Get.height * 0.97,
                    width: Get.width * 0.9,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: Get.height * 0.02),
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  color: AppColors.primarycolor,
                                ),
                              ],
                            ),
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
                        Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.1),
                          child: Row(children: [Text('Name')]),
                        ),
                        Commontextfield(
                          tittle: 'Enter your name',
                          obsecuretext: false,
                          textcontroller: controller.namecontroller,
                        ),

                        SizedBox(height: Get.height * 0.02),
                        Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.1),
                          child: Row(children: [Text('Email')]),
                        ),
                        Commontextfield(
                          tittle: 'Enter your email',
                          obsecuretext: false,
                          textcontroller: controller.emailcontroller,
                        ),
                        SizedBox(height: Get.height * 0.02),
                        Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.1),
                          child: Row(children: [Text('Gender')]),
                        ),
                        Commontextfield(
                          tittle: 'Male/Female',
                          obsecuretext: false,
                          textcontroller: controller.gendercontroller,
                        ),
                        SizedBox(height: Get.height * 0.02),
                        // Padding(
                        //   padding: EdgeInsets.only(left: Get.width * 0.1),
                        //   child: Row(children: [Text('Age')]),
                        // ),
                        // Commontextfield(
                        //   tittle: 'Enter your age',
                        //   obsecuretext: false,
                        //   textcontroller: controller.agecontroller,
                        // ),
                        // Age Dropdown Widget
                        Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.1),
                          child: Row(children: [Text('Age')]),
                        ),
                        Obx(
                          () => Container(
                            height: Get.height * 0.05,
                            width: Get.width * 0.7,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Color(0xffEDF1F3),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<int>(
                                hint: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Select your age',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color(0xff1A1C1E),
                                    ),
                                  ),
                                ),
                                value: controller.selectedAge.value == 0
                                    ? null
                                    : controller.selectedAge.value,
                                isExpanded: true,
                                icon: Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Color(0xff1A1C1E),
                                  ),
                                ),
                                padding: EdgeInsets.only(left: 10),
                                items: List.generate(90, (index) => index + 10)
                                    .map(
                                      (age) => DropdownMenuItem<int>(
                                        value: age,
                                        child: Text(
                                          age.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: Color(0xff1A1C1E),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    controller.selectedAge.value = value;
                                  }
                                },
                                selectedItemBuilder: (BuildContext context) {
                                  return List.generate(
                                    90,
                                    (index) => index + 10,
                                  ).map((age) {
                                    return Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        age.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff1A1C1E),
                                        ),
                                      ),
                                    );
                                  }).toList();
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.1),
                          child: Row(children: [Text('Profession')]),
                        ),
                        Commontextfield(
                          tittle: 'Enter your profession',
                          obsecuretext: false,
                          textcontroller: controller.professioncontroller,
                        ),
                        SizedBox(height: Get.height * 0.02),
                        // Country Dropdown Widget
                        Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.1),
                          child: Row(children: [Text('Nationality')]),
                        ),
                        Obx(
                          () => Container(
                            height: Get.height * 0.05,
                            width: Get.width * 0.7,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Color(0xffEDF1F3),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Select your country',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color(0xff1A1C1E),
                                    ),
                                  ),
                                ),
                                value: controller.selectedCountry.value.isEmpty
                                    ? null
                                    : controller.selectedCountry.value,
                                isExpanded: true,
                                icon: Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Color(0xff1A1C1E),
                                  ),
                                ),
                                padding: EdgeInsets.only(left: 10),
                                items: controller.countries
                                    .map(
                                      (country) => DropdownMenuItem<String>(
                                        value: country,
                                        child: Text(
                                          country,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: Color(0xff1A1C1E),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    controller.selectedCountry.value = value;
                                  }
                                },
                                selectedItemBuilder: (BuildContext context) {
                                  return controller.countries.map((country) {
                                    return Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        country,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff1A1C1E),
                                        ),
                                      ),
                                    );
                                  }).toList();
                                },
                              ),
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(left: Get.width * 0.1),
                        //   child: Row(children: [Text('Nationality')]),
                        // ),
                        // Commontextfield(
                        //   tittle: 'Enter your nationality',
                        //   obsecuretext: false,
                        //   textcontroller: controller.nationalitycontroller,
                        // ),
                        SizedBox(height: Get.height * 0.02),
                        Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.1),
                          child: Row(children: [Text('Instagram/Facebook')]),
                        ),
                        Commontextfield(
                          tittle: 'Link of your instagram/facebook profile',
                          obsecuretext: false,
                          textcontroller: controller.instagramcontroller,
                        ),
                        SizedBox(height: Get.height * 0.02),
                        Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.1),
                          child: Row(children: [Text('LinkedIn')]),
                        ),
                        Commontextfield(
                          tittle: 'Link of your LinkedIn profile',
                          obsecuretext: false,
                          textcontroller: controller.linkedincontroller,
                        ),
                        SizedBox(height: Get.height * 0.015),

                        GestureDetector(
                          onTap: () => Get.toNamed(
                            AppPages.signupsecond,
                            arguments: {
                              'name': controller.namecontroller.text,
                              'email': controller.emailcontroller.text,
                              'gender': controller.gendercontroller.text
                                  .toLowerCase(),
                              'age': controller.selectedAge.toString(),
                              'profession':
                                  controller.professioncontroller.text,
                              'nationality': controller.selectedCountry
                                  .toString(),
                              'instagram': controller.instagramcontroller.text,
                              'linkedin': controller.linkedincontroller.text,
                            },
                          ),
                          child: Container(
                            height: Get.height * 0.03,
                            width: Get.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(99),
                              color: AppColors.primarycolor,
                            ),
                            child: Center(
                              child: Text(
                                'Next',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        // GestureDetector(
                        //   onTap: () => Get.back(),
                        //   child: Container(
                        //     height: Get.height * 0.03,
                        //     width: Get.width * 0.4,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(99),
                        //       color: AppColors.primarycolor,
                        //     ),
                        //     child: Center(
                        //       child: Text(
                        //         'Back',
                        //         style: TextStyle(
                        //           fontWeight: FontWeight.w600,
                        //           fontSize: 14,
                        //           color: Colors.black,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
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
