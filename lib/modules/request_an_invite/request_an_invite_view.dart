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
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: Get.height * 0.8,
                  width: Get.width * 0.9,
                  child: Column(
                   // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: Get.height * 0.02),
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
                        tittle: 'Rayhan',
                        obsecuretext: false,
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Padding(
                        padding: EdgeInsets.only(left: Get.width * 0.1),
                        child: Row(children: [Text('Email')]),
                      ),
                      Commontextfield(
                        tittle: 'Rayhantmt@gmail.com',
                        obsecuretext: false,
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Padding(
                        padding: EdgeInsets.only(left: Get.width * 0.1),
                        child: Row(children: [Text('Gender')]),
                      ),
                      Commontextfield(
                        tittle: 'Male/Female',
                        obsecuretext: false,
                      ),
                      SizedBox(height: Get.height * 0.02),Padding(
                        padding: EdgeInsets.only(left: Get.width * 0.1),
                        child: Row(children: [Text('Age')]),
                      ),
                      Commontextfield(
                        tittle: 'Enter your age',
                        obsecuretext: false,
                      ),
                      SizedBox(height: Get.height * 0.02),Padding(
                        padding: EdgeInsets.only(left: Get.width * 0.1),
                        child: Row(children: [Text('Profession')]),
                      ),
                      Commontextfield(
                        tittle: 'Enter your profession',
                        obsecuretext: false,
                      ),
                      SizedBox(height: Get.height * 0.02),Padding(
                        padding: EdgeInsets.only(left: Get.width * 0.1),
                        child: Row(children: [Text('Nationality')]),
                      ),
                      Commontextfield(
                        tittle: 'Enter your nationality',
                        obsecuretext: false,
                      ),
                      SizedBox(height: Get.height * 0.02),Padding(
                        padding: EdgeInsets.only(left: Get.width * 0.1),
                        child: Row(children: [Text('Instagram')]),
                      ),
                      Commontextfield(
                        tittle: 'Link of your instagram profile',
                        obsecuretext: false,
                      ),
                     SizedBox(height: Get.height * 0.015),
                      
                     GestureDetector(
                          onTap: () => Get.toNamed(AppPages.signupsecond),
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
                     
                     
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}