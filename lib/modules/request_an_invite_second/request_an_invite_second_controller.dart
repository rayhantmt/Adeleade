import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RequestAnInviteSecondController extends GetxController {
  RxBool isObscured = false.obs;
  RxBool isObscured1 = false.obs;

  // Store picked images (like TextEditingController for text)
  RxList<XFile> selectedImages = <XFile>[].obs;

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

  // Trigger API call with selected images
  Future<void> submitInviteRequest() async {
    if (selectedImages.isEmpty) {
      Get.snackbar('Error', 'Please select at least one image');
      return;
    }

    // Replace this with your actual API call logic
    // Example:
    // await ApiService.uploadImages(selectedImages);

    Get.snackbar(
      'Success',
      'Your account creation request has been submitted!',
      animationDuration: const Duration(seconds: 2),
    );
  }
}
