import 'package:get/get.dart';
import 'package:mementum/modules/home/home_model.dart';

class EventDetailsController extends GetxController {
  late String image;
  late String tittle;
  late String time;
  late String location;
  late String details;
  late String host;
  late String hostphoto;
  late String maxpeople;
  late String joinedPeople;
  late String id;
  late List<Participant> ppl;
  @override
  void onInit() {
    super.onInit();
    var arg = Get.arguments;
    image = arg['image'];
    tittle = arg['tittle'];
    time = arg['time'];
    location = arg['location'];
    details = arg['eventDeatils'];
    host = arg['hostedby'];
    hostphoto = arg['hostphotourl'];
    joinedPeople = arg['joinedpeople'];
    maxpeople = arg['maxpeople'];
    id = arg['id'];
    ppl=arg['perticanpants'];
  }

  // var isLoading = false.obs;
  // Future<void> joinevent() async {
  //   isLoading.value = true;
  //   try{
      
  //   }
  //   on AppException catch (e){
  //     Get.snackbar('Error', e.toString());
  //   } 
  // }
}
