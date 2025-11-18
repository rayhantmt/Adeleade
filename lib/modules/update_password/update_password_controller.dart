import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdatePasswordController extends GetxController{


RxBool isObscured = false.obs;
final eamil=Get.arguments;
final passwordcontroller=TextEditingController();

  void toggleObscureText() {
    isObscured.value = !isObscured.value;
  }
  RxBool isObscured1 = false.obs;

  void toggleObscureText1() {
    isObscured1.value = !isObscured1.value;
  }

}