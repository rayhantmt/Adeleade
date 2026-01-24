import 'package:get/get.dart';
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
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
