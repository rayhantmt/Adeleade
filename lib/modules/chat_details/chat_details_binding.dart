import 'package:get/get.dart';
import 'package:mementum/modules/chat_details/chat_details_controller.dart';

class ChatDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ChatDetailsController>(() => ChatDetailsController(),);
  }
}