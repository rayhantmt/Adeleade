import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mementum/common_widgets/textfield.dart';
import 'package:mementum/modules/update_password/update_password_controller.dart';
import 'package:mementum/utils/app_colors.dart';

class UpdatePasswordView extends GetView<UpdatePasswordController> {
  const UpdatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xffFAF2ED),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: double.infinity,),
             Text(
                  "Momentum",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: AppColors.primarycolor,
                  ),
                ),
                SizedBox(height: Get.height * 0.033),
                Text('Update Password',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                  color: Colors.black
                ),
                ),
                 SizedBox(height: Get.height * 0.033),
                 Text('The password must be different than previous',
                 style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff7D848D)
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
                      
                     
                      SizedBox(height: Get.height * 0.033),
                      Container(
                        height: Get.height * 0.07,
                        width: Get.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(99),
                          color: AppColors.primarycolor,
                        ),
                        child: Center(
                          child: Text(
                            'Update Password',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}