import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LogInController extends GetxController{
RxBool isObscured = false.obs;
final emailcontroller=TextEditingController();
final passwordcontroller=TextEditingController();

  void toggleObscureText() {
    isObscured.value = !isObscured.value;
  }
  var isChecked = false.obs;

  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;}


}