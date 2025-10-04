import 'package:get/get.dart';
import 'package:mementum/modules/otp_page/otp_page_controller.dart';

class OtpPageBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<OtpController>(() => OtpController(),);
  }
}