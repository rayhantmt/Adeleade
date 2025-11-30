import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MemoriesController extends GetxController{
  var memorytype = 0.obs; // 0 = On-Time, 1 = Recurring Deposit
Rxn<XFile> eventImage=Rxn<XFile>();
  void setDepositType(int type) {
    memorytype.value = type;
  }
  final ImagePicker _picker=ImagePicker();
  Future pickEventImage()async{
   try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      if (picked != null) {
        eventImage.value = picked;
        eventImage.refresh();
        print('Event Image picked: ${picked.path}');
        Get.snackbar('Event image', picked.path);
      } else {
        print('Cover pick cancelled');
      }
    } catch (e) {
      print('Error picking event image: $e');
      Get.snackbar('Error', 'Failed to pick event image: $e');
    }
  }
}