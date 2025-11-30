import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:image_picker/image_picker.dart';
import 'package:mementum/api/api_config.dart';
import 'package:mementum/api/dio_client.dart';
import 'package:mementum/core/exceptions.dart';
import 'package:http_parser/http_parser.dart';

class MemoriesController extends GetxController {
  var memorytype = 0.obs; // 0 = On-Time, 1 = Recurring Deposit
  Rxn<XFile> eventImage = Rxn<XFile>();
  void setDepositType(int type) {
    memorytype.value = type;
  }

  final ImagePicker _picker = ImagePicker();
  Future pickEventImage() async {
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

  RxBool isLoading = false.obs;
  final DioClient _client = DioClient();
  Future<void> createEvent() async {
    isLoading.value = true;
    if (eventImage.value == null) {
      Get.snackbar('Error', 'Please select a profile image');
      return;
    }

    try {
      // 2. Prepare Gallery Files

      // 3. Create FormData
      final formData = FormData.fromMap({
        'name': '',
        'eventDate': '',
        'location': '',
        'category': '',
        'details': '',
        'maxParticipants': '',
        'eventImage': await MultipartFile.fromFile(
          eventImage.value!.path,
          filename: eventImage.value!.name,
          contentType: MediaType('image', 'png'),
        ),
      });

      // 4. API Call
      final response = await _client.postFormData(
        url: '${ApiConfig.baseUrl}/api/v1/user/sign-up',
        data: formData,
      );

      print('✅ User Created: ${response.data}');
      Get.snackbar('Success', 'User Created Successfully');
    } on BadRequestException catch (e) {
      // Caught by our custom DioClient logic
      Get.snackbar('Registration Failed', e.toString());
      print('❌ API Error: $e');
    } on DioException catch (e) {
      // Catch generic Dio errors that might slip through
      Get.snackbar('Error', 'Network error: ${e.message}');
    } catch (e) {
      // Catch logic errors (like the one you were seeing)
      print('❌ Unexpected Error: $e');
      Get.snackbar('Error', 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
