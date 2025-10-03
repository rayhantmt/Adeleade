import 'package:get/get.dart';

class LogInController extends GetxController{
RxBool isObscured = false.obs;

  void toggleObscureText() {
    isObscured.value = !isObscured.value;
  }

}