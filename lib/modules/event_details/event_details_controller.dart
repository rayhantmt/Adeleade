import 'package:get/get.dart';

class EventDetailsController extends GetxController{
  late String image;
  late String tittle;
  late String time;
  late String location;
  late String details;
  late String host;
  late String hostphoto;
  @override
  void onInit() {
    super.onInit();
    var arg=Get.arguments;
     image =arg['image'];
     tittle=arg['tittle'];
     time=arg['time'];
     location=arg['location'];
     details=arg['eventDeatils'];
     host=arg['hostedby'];
     hostphoto=arg['hostphotourl'];
     
  }
}