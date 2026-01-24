import 'package:get/get.dart';
import 'package:mementum/modules/edit_profile/edit_profile_controller.dart';

class EditProfileBining extends Bindings{
  @override
  void dependencies() {
Get.lazyPut<EditProfileController>(() => EditProfileController(),);
  }
}