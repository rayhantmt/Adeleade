import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mementum/api/api_config.dart';
import 'package:mementum/api/api_services.dart';
import 'package:mementum/core/exceptions.dart';

class MainScreenController extends GetxController {
  var currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }

  RxBool isloading = false.obs;

  Future<void> Deleteuser() async {
    final token = GetStorage().read('token');
    final id = GetStorage().read('id');
    isloading.value = true;
    try {
      final response = await ApiService.delete(
        endpoint: '${ApiConfig.deleteaccount + id}',
        headers: {'Authorization': token},
      );
      print(response);
    } on AppException catch (e) {
      Get.snackbar('Error', e.toString());
      print(e.toString());
    } finally {
      isloading.value = false;
    }
  }
}
