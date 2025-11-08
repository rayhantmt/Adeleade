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
  Rx<XFile?> profileImage = Rx<XFile?>(null);
  Rx<XFile?> coverImage = Rx<XFile?>(null);
  final ImagePicker _picker = ImagePicker();

  void toggleObscureText() {
    isObscured.value = !isObscured.value;
  }

  void toggleObscureText1() {
    isObscured1.value = !isObscured1.value;
  }

  // Pick multiple images (max 5)
  Future<void> pickImages() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null && images.isNotEmpty) {
      selectedImages.assignAll(images.take(5).toList());
    }
  }

  // Pick single profile image
  Future<void> pickProfileImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImage.value = image;
    }
  }

  Future<void> pickCoverImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      coverImage.value = image;
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
      // Convert selectedImages RxList to MultipartFile list
      List<MultipartFile> galleryFiles = [];
      for (var image in selectedImages) {
        galleryFiles.add(
          await MultipartFile.fromFile(
            image.path,
            filename: image.name,
          ),
        );
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
        'galleryPhotos': galleryFiles, // 👈 dynamic list now
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
      print(FormData);
    }
  }
}
