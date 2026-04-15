import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mementum/global_service.dart';
import 'package:mementum/routes/app_pages.dart';

class EditProfileController extends GetxController {
  final globalcontroller = Get.find<GlobalService>();
  final ImagePicker picker = ImagePicker();
  final ImagePicker picker2 = ImagePicker();
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
      _uploadAndSendMedia2(
        File(coverImage.value!.path),
        'update-cover-photo',
        'cover',
      );
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
        'avatar',
      );
    } catch (e) {
      Get.snackbar('Error', e.toString());
      print(e.toString());
    }
  }

  var profileimgloading = false.obs;
  var coverimageloading = false.obs;

  Future<void> _uploadAndSendMedia(File file, String url, String imgtyp) async {
    try {
      profileimgloading.value = true;
      final dio = Dio();
      final token = GetStorage().read('token');
      final formdata = FormData.fromMap({
        imgtyp: await MultipartFile.fromFile(file.path),
      });
      final response = await dio.patch(
        options: Options(headers: {'Authorization': "Bearer $token"}),
        data: formdata,
        'https://server.momentumactivity.com/api/v1/user/$url',
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('Success', "Profile Image Updated Successfully");
        final updateimgurl = response.data['data']['photoURL'];
        print('This is updated profile image$updateimgurl');
        globalcontroller.profileimage.value = updateimgurl;
        print(response);
        print(response.data.toString());
        Get.toNamed(AppPages.mainscreen);
      } else {
        throw Get.snackbar('Error', response.data);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      print(e.toString());
    } finally {
      profileimgloading.value = false;
    }
  }

  Future<void> _uploadAndSendMedia2(
    File file,
    String url,
    String imgtyp,
  ) async {
    try {
      coverimageloading.value=true;
      final dio = Dio();
      final token = GetStorage().read('token');
      final formdata = FormData.fromMap({
        imgtyp: await MultipartFile.fromFile(file.path),
      });
      final response = await dio.patch(
        options: Options(headers: {'Authorization': "Bearer $token"}),
        data: formdata,
        'https://server.momentumactivity.com/api/v1/user/$url',
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('Success', "Profile Image Updated Successfully");
        final updateimgurl = response.data['data']['coverPhotoURL'];
        print('This is updated cover image$updateimgurl');
        globalcontroller.coverimage.value = updateimgurl;
        print(response);
        print(response.data.toString());
        Get.toNamed(AppPages.mainscreen);
      } else {
        throw Get.snackbar('Error', response.data);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      print(e.toString());
    }
    finally{
      coverimageloading.value=false;
    }
  }
}
