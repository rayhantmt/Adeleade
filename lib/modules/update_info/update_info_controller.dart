import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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
    isloadin.value = true;
    try {
      final response = await ApiService.patch(
        endpoint: ApiConfig.updateprofile,
        body: {
          "name": namecontroller.text,
          "bio": biocontroller.text,
          "profession": professioncontroller.text,
          "nationality": nationalitycontroller.text,
          "instagram": instagramcontroller.text,
          "linkedIn": linkedincontroller.text,
        },
      );
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
