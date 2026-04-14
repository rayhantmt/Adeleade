import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mementum/api/api_config.dart';
import 'package:mementum/api/api_services.dart';
import 'package:mementum/core/exceptions.dart';
import 'package:mementum/global_service.dart';
import 'package:mementum/routes/app_pages.dart';

class UpdateInfoController extends GetxController {
  final namecontroller = TextEditingController();
  final biocontroller = TextEditingController();
  final professioncontroller = TextEditingController();
  final nationalitycontroller = TextEditingController();
  final instagramcontroller = TextEditingController();
  final linkedincontroller = TextEditingController();

  RxBool isloadin = false.obs;

  Future<void> updateprofile() async {
    final ss = Get.find<GlobalService>();
    final storage = GetStorage();
    final token = storage.read('token');
    isloadin.value = true;
    try {
      final body = {
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
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      print(body);
      print('response $response');
      ss.updaedinfo(
        namecontroller.text,
        biocontroller.text,
        professioncontroller.text,
        nationalitycontroller.text,
        instagramcontroller.text,
        linkedincontroller.text,
      );
      Get.snackbar(
        'Success',
        'Congratulations profile updated successfully\n Log out from the app and log in again to see the profile changes',
      );
      Get.toNamed(AppPages.mainscreen);
    } on AppException catch (e) {
      Get.snackbar('Updating profile failed ', e.toString());
    } finally {
      isloadin.value = false;
    }
  }
}
