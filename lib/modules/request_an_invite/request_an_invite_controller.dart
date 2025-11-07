import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RequestAnInviteController extends GetxController{
  RxBool isObscured = false.obs;
  final namecontroller=TextEditingController();
  final emailcontroller=TextEditingController();
  final gendercontroller=TextEditingController();
  final agecontroller=TextEditingController();
  final professioncontroller=TextEditingController();
  final nationalitycontroller=TextEditingController();
  final instagramcontroller=TextEditingController();
  void toggleObscureText() {
    isObscured.value = !isObscured.value;
  }
  RxBool isObscured1 = false.obs;

  void toggleObscureText1() {
    isObscured1.value = !isObscured1.value;
  }
}