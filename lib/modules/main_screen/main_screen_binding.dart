
import 'package:get/get.dart';
import 'package:mementum/modules/chat_box/chat_controller.dart';
import 'package:mementum/modules/home/home_controller.dart';
import 'package:mementum/modules/main_screen/main_screen_controller.dart';
import 'package:mementum/modules/memories/memories_controller.dart';

class MainScreenBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<MainScreenController>(() => MainScreenController(),);
    Get.lazyPut<HomeController>(() => HomeController(),);
       Get.lazyPut<MemoriesController>(() => MemoriesController(),);
       Get.lazyPut<ChatController>(() => ChatController(),);
  }
}