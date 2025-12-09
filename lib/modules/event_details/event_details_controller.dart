import 'package:get/get.dart';

class EventDetailsController extends GetxController{
  late String image;
  late String tittle;
  late String time;
  late String location;
  late String details;
  @override
  void onInit() {
    super.onInit();
    var arg=Get.arguments;
     image =arg['image'];
     tittle=arg['tittle'];
     time=arg['time'];
     location=arg['location'];
     details=arg['eventdetails'];
     
  }
}