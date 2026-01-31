import 'package:get/get.dart';
import 'package:mementum/modules/subscription/subscription_controller.dart';

class SubscriptionBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SubscriptionController>(() => SubscriptionController(),);
  }
}