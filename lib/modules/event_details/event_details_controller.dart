import 'package:get/get.dart';

class EventDetailsController extends GetxController{
  late String image;
  late String tittle;
  @override
  void onInit() {
    super.onInit();
    var arg=Get.arguments;
     image =arg['image'];
     tittle=arg['tittle'];
  }
}