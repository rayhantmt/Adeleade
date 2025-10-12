import 'package:get/get.dart';
import 'package:mementum/modules/request_an_invite_second/request_an_invite_second_controller.dart';

class RequestAnInviteSecondBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RequestAnInviteSecondController>(() => RequestAnInviteSecondController(),);
  }
}