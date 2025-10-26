import 'package:get/get.dart';
import 'package:mementum/modules/profile_details/profile_controller.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}