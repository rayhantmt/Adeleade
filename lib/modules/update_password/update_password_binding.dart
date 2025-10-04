import 'package:get/get.dart';
import 'package:mementum/modules/update_password/update_password_controller.dart';

class UpdatePasswordBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<UpdatePasswordController>(() => UpdatePasswordController(),);
  }
}