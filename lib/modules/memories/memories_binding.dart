import 'package:get/get.dart';
import 'package:mementum/modules/memories/memories_controller.dart';

class MemoriesBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<MemoriesController>(() => MemoriesController(),);
  }
}