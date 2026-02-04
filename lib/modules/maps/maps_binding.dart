import 'package:get/get.dart';
import 'package:mementum/modules/maps/maps_controller.dart';

class MapsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MapsController>(() => MapsController());
  }
}