import 'package:get/get.dart';
import 'package:mementum/modules/connection_requests/connection_request_controller.dart';

class ConnectionRequestBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ConnectionRequestController>(() => ConnectionRequestController(),);
    
  }
}