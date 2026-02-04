// import 'dart:io';

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mementum/core/exceptions.dart';
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
  late String hostid;
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
    ppl = arg['perticanpants'];
    hostid=arg['hostid'];
  }

  
  RxBool isLoading = false.obs;
  Future<void> joinEvent() async {
    final uri = Uri.parse('https://server.momentumactivity.com/api/v1/event/$id/join');
    final storage = GetStorage();
    final token = storage.read('token');
    isLoading.value = true;
    try {
      final response = await http.post(
        uri,
        headers: {'Authorization':token},
        body: {}
      );
      
      print(uri.toString());
      
      print(response.statusCode);
      print(response.body);
      //Get.snackbar('Success', response.body);
      final decodedData = jsonDecode(response.body);

    // 2. Check the 'success' flag to determine the title (Success vs Error)
    //    and show ONLY the 'message' field in the snackbar.
    if (decodedData['success'] == true) {
      Get.snackbar('Success', decodedData['message']);
    } else {
      // If success is false (like "You have already joined"), show it as an Alert/Error
      Get.snackbar('Alert', '${decodedData['message']} ');
    }
    } 
    
    
    on AppException catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed to join event $e');
    } finally {
      isLoading.value = false;
    }
  }
}
