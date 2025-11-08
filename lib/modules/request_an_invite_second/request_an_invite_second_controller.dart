//import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RequestAnInviteSecondController extends GetxController {
  RxBool isObscured = false.obs;
  RxBool isObscured1 = false.obs;

  final passwordcontroller =TextEditingController();
late String? name='';
late String? email='';
late String? gender='';
late String? age='';
late String? profession='';
late String? nationality='';
late String? instagram='';

 
  final biocontroller =TextEditingController();

  
  final linkedincontroller =TextEditingController();



  // Store picked images (like TextEditingController for text)
  RxList<XFile> selectedImages = <XFile>[].obs;
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
      selectedImages.map((file) => file.path).toList().toString()
,
      animationDuration: const Duration(seconds: 2),
    );
  }
}
