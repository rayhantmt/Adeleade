import 'package:get/get.dart';
import 'package:mementum/modules/event_details/event_details_controller.dart';

class EventDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EventDetailsController>(() => EventDetailsController(),);
  }
}