import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  final ImagePicker picker = ImagePicker();
  final ImagePicker picker2=ImagePicker();
  Rxn<XFile> coverImage = Rxn<XFile>();
  Rxn<XFile> profileImage = Rxn<XFile>();
  Future<void> pickCoverImage() async {
    try {
      final XFile? pickedImage = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedImage != null) {
        coverImage.value = pickedImage;
      } else {
        Get.snackbar('Error', "Please select your cover image");
      }
      _uploadAndSendMedia(File(coverImage.value!.path), 'update-cover-photo');
    } catch (e) {
      Get.snackbar('Error', e.toString());
      print(e.toString());
    }
  }

  Future<void> pickprofileImage() async {
    try {
      final XFile? picked2Image = await picker2.pickImage(
        source: ImageSource.gallery,
      );
      if (picked2Image != null) {
        profileImage.value = picked2Image;
      } else {
        Get.snackbar('Error', "Please select your profile image");
      }
      _uploadAndSendMedia(
        File(profileImage.value!.path),
        'update-profile-photo',
      );
    } catch (e) {
      Get.snackbar('Error', e.toString());
      print(e.toString());
    }
  }

  Future<void> _uploadAndSendMedia(File file, String url) async {
    try {
      final dio = Dio();
      final token = GetStorage().read('token');
      final formdata = FormData.fromMap({
        'cover': await MultipartFile.fromFile(file.path),
      });
      final response = await dio.patch(
        options: Options(headers: {'Authorization': "Bearer $token"}),
        data: formdata,
        'https://server.momentumactivity.com/api/v1/user/$url',
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
          'Success',
          "Image updated log in to account again to see the updates",
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
}
