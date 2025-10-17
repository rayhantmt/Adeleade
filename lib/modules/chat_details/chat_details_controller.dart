import 'package:get/get.dart';

class ChatDetailsController extends GetxController{
  late String img;
  late String name;
  @override
  void onInit() {
    
    super.onInit();
    var args=Get.arguments;
    img=args['image'];
    name=args['name'];

  }
}