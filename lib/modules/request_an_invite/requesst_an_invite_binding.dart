import 'package:get/get.dart';
import 'package:mementum/modules/request_an_invite/request_an_invite_controller.dart';

class RequesstAnInviteBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RequestAnInviteController>(() => RequestAnInviteController(),);
  }
}