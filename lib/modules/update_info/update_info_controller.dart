import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mementum/api/api_config.dart';
import 'package:mementum/api/api_services.dart';
import 'package:mementum/core/exceptions.dart';

class UpdateInfoController extends GetxController {
  final namecontroller=TextEditingController();
  final biocontroller=TextEditingController();
  final professioncontroller=TextEditingController();
  final nationalitycontroller=TextEditingController();
  final instagramcontroller=TextEditingController();
  final linkedincontroller=TextEditingController();

  RxBool isloadin = false.obs;
  
  Future<void> updateprofile() async {
    final storage = GetStorage();
  final token= storage.read('token');
    isloadin.value = true;
    try {
      final body={
          "name": namecontroller.text,
          "bio": biocontroller.text,
          "profession": professioncontroller.text,
          "nationality": nationalitycontroller.text,
          "instagram": instagramcontroller.text,
          "linkedIn": linkedincontroller.text,
        };
      final response = await ApiService.patch(
        endpoint: ApiConfig.updateprofile,
        body: body,
        
        headers: {
          'Authorization':'Bearer $token'
        }
      );
      print(body);
      print('response $response');
      Get.snackbar('Success', 'Congratulations profile updated successfully');
    } on AppException catch (e) {
      Get.snackbar('Updating profile failed ', e.toString());
    }
    finally{
      isloadin.value=false;
    }
  }
}
