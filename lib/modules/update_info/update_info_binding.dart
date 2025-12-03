
import 'package:get/get.dart';
import 'package:mementum/modules/update_info/update_info_controller.dart';

class UpdateInfoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<UpdateInfoController>(() => UpdateInfoController(),);
  }
}