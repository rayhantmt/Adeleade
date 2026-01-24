import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  final ImagePicker picker = ImagePicker();
  Rxn<XFile> profileImage = Rxn<XFile>();
  Future<void> pickProfileImage() async {
    try {
      final XFile? pickedImage = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedImage != null) {
        profileImage.value = pickedImage;
      } else {
        Get.snackbar('Error', "Please select your profile image");
      }
      _uploadAndSendMedia(File(profileImage.value!.path));
    } catch (e) {
      Get.snackbar('Error', e.toString());
      print(e.toString());
    }
  }
}

Future<void> _uploadAndSendMedia(File file) async {
  try {
    final dio = Dio();
    final token = GetStorage().read('token');
    final formdata = FormData.fromMap({
      'cover': await MultipartFile.fromFile(file.path),
    });
    final response = await dio.patch(
      options: Options(headers: {'Authorization': "Bearer $token"}),
      data: formdata,
      'https://server.momentumactivity.com/api/v1/user/update-cover-photo',
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.snackbar(
        'Success',
        "Cover image updated restart the application to see the updates",
      );
      print(response.data.toString());
    } else {
      throw Get.snackbar('Error', response.data);
      
    }
  } catch (e) {
    Get.snackbar('Error', e.toString());
    print(e.toString());
  }
}
