//import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:image_picker/image_picker.dart';
import 'package:mementum/api/api_config.dart';
import 'package:mementum/api/dio_client.dart';
import 'package:dio/dio.dart';

class RequestAnInviteSecondController extends GetxController {
  RxBool isObscured = false.obs;
  RxBool isObscured1 = false.obs;

  final passwordcontroller = TextEditingController();
  late String? name = '';
  late String? email = '';
  late String? gender = '';
  late String? age = '';
  late String? profession = '';
  late String? nationality = '';
  late String? instagram = '';

  final biocontroller = TextEditingController();
  final linkedincontroller = TextEditingController();
  final DioClient _client = DioClient();

  // Store picked images
  RxList<XFile> selectedImages = <XFile>[].obs;

  // Use nullable Rx (Rxn) instead of XFile('') to avoid empty-path files
  Rxn<XFile> profileImage = Rxn<XFile>();
  Rxn<XFile> coverImage = Rxn<XFile>();

  final ImagePicker _picker = ImagePicker();

  void toggleObscureText() {
    isObscured.value = !isObscured.value;
  }

  void toggleObscureText1() {
    isObscured1.value = !isObscured1.value;
  }

  // Pick multiple images (max 5)
  Future<void> pickImages() async {
    try {
      final List<XFile>? images = await _picker.pickMultiImage();
      if (images != null && images.isNotEmpty) {
        selectedImages.assignAll(images.take(5).toList());
        Get.snackbar('Images selected', selectedImages.map((e) => e.path).toList().toString());
      }
    } catch (e) {
      print('Error picking images: $e');
      Get.snackbar('Error', 'Failed to pick images: $e');
    }
  }

  // Pick single profile image
  Future<void> pickProfileImage() async {
    try {
      final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
      if (picked != null) {
        profileImage.value = picked;
        print('Profile picked: ${picked.path}');
        Get.snackbar('Profile image', picked.path);
      } else {
        print('Profile pick cancelled');
      }
    } catch (e) {
      print('Error picking profile image: $e');
      Get.snackbar('Error', 'Failed to pick profile image: $e');
    }
  }

  Future<void> pickCoverImage() async {
    try {
      final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
      if (picked != null) {
        coverImage.value = picked;
        print('Cover picked: ${picked.path}');
        Get.snackbar('Cover image', picked.path);
      } else {
        print('Cover pick cancelled');
      }
    } catch (e) {
      print('Error picking cover image: $e');
      Get.snackbar('Error', 'Failed to pick cover image: $e');
    }
  }

  // Trigger API call with selected images
  Future<void> submitInviteRequest() async {
    if (selectedImages.isEmpty) {
      Get.snackbar('Error', 'Please select at least one image');
      return;
    }

    Get.snackbar(
      'Success',
      selectedImages.map((file) => file.path).toList().toString(),
      animationDuration: const Duration(seconds: 2),
    );
  }

  // ✅ Modified createUser with dynamic galleryPhotos from selectedImages
  Future<void> createUser() async {
    try {
      // Validate required files using null checks (Rxn)
      if (profileImage.value == null) {
        Get.snackbar('Error', 'Please select a profile image');
        return;
      }
      if (coverImage.value == null) {
        Get.snackbar('Error', 'Please select a cover image');
        return;
      }

      // Convert selectedImages RxList to MultipartFile list (skip empty paths)
      List<MultipartFile> galleryFiles = [];
      for (var image in selectedImages) {
        if (image.path.isNotEmpty) {
          galleryFiles.add(
            await MultipartFile.fromFile(
              image.path,
              filename: image.name,
            ),
          );
        }
      }

      final formData = FormData.fromMap({
        'email': email,
        'password': passwordcontroller.text,
        'name': name,
        'gender': gender,
        'bio': biocontroller.text,
        'nationality': nationality,
        'profession': profession,
        'linkedIn': linkedincontroller.text,
        'instagram': instagram,
        'avatar': await MultipartFile.fromFile(
          profileImage.value!.path,
          filename: profileImage.value!.name,
        ),
        'cover': await MultipartFile.fromFile(
          coverImage.value!.path,
          filename: coverImage.value!.name,
        ),
        'galleryPhotos': galleryFiles,
      });

      final response = await _client.postFormData(
        url: '${ApiConfig.baseUrl}/api/v1/user/sign-up',
        data: formData,
      );

      print('✅ User Created: ${response.data}');
      Get.snackbar('success', '✅ User Created: ${response.data}');
    } catch (e) {
      print('❌ Error creating user: $e');
      Get.snackbar('Error','❌ Error creating user: $e' );
    }
  }
}
