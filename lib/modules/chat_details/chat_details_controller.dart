import 'package:get/get.dart';

class ChatDetailsController extends GetxController{
  late String img;
  late String name;
  @override
  void onInit() {
    
    super.onInit();
    var arg=Get.arguments;
    img=arg['image'];
    name=arg['name'];

  }
}