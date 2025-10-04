import 'package:get/get.dart';

class RequestAnInviteController extends GetxController{
  RxBool isObscured = false.obs;

  void toggleObscureText() {
    isObscured.value = !isObscured.value;
  }
}