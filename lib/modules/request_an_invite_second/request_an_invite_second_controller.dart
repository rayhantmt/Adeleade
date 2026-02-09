import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:image_picker/image_picker.dart';
import 'package:mementum/api/api_config.dart';
import 'package:mementum/api/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mementum/core/exceptions.dart';
import 'package:mementum/routes/app_pages.dart';

class RequestAnInviteSecondController extends GetxController {
  RxBool isObscured = true.obs;
  RxBool isObscured1 = true.obs;

RxBool isLoading=false.obs;
  final passwordcontroller = TextEditingController();
  late String? name = '';
  late String? email = '';
  late String? gender = '';
  late String? age = '';
  late String? profession = '';
  late String? nationality = '';
  late String? instagram = '';
  late String? linkedin='';

  final biocontroller = TextEditingController();
  final linkedincontroller = TextEditingController();
  final DioClient _client = DioClient();

  // Store picked images
  RxList<XFile> selectedImages = <XFile>[].obs;

  // Use nullable Rx (Rxn) instead of XFile('') to avoid empty-path files
  Rxn<XFile> profileImage = Rxn<XFile>();
  Rxn<XFile> coverImage = Rxn<XFile>();

  final ImagePicker _picker = ImagePicker();

  // Allowed image file extensions for upload
  final List<String> allowedExtensions = ['jpg', 'jpeg', 'png', 'webp'];

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
        // Get.snackbar(
        //   'Images selected',
        //   //selectedImages.map((e) => e.path).toList().toString(),
        //   ''
        // );
      }
    } catch (e) {
      print('Error picking images: $e');
      Get.snackbar('Error', 'Failed to pick images: $e');
    }
  }

  // Pick single profile image
  Future<void> pickProfileImage() async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      if (picked != null) {
        profileImage.value = picked;
        // print('Profile picked: ${picked.path}');
        // Get.snackbar('Profile image', picked.path);
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
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      if (picked != null) {
        coverImage.value = picked;
        coverImage.refresh();
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
  // In request_an_invite_second_controller.dart

Future<void> createUser() async {
  isLoading.value=true;
  if (profileImage.value == null) {
    Get.snackbar('Error', 'Please select a profile image');
    return;
  }
  // if (coverImage.value == null) {
  //   Get.snackbar('Error', 'Please select a cover image');
  //   return;
  // }
  if (selectedImages.isEmpty) {
    Get.snackbar('Error', 'Please select at least one gallery image');
    return;
  }

  try {
    // 2. Prepare Gallery Files
    List<MultipartFile> galleryFiles = [];
    for (var image in selectedImages) {
      final ext = image.path.split('.').last.toLowerCase();
      if (allowedExtensions.contains(ext)) {
        galleryFiles.add(
          await MultipartFile.fromFile(
            image.path,
            filename: image.name,
            // Simple logic: if not png, assume jpeg for safety
            contentType: ext == 'png'
                ? MediaType('image', 'png')
                : MediaType('image', 'jpeg'),
          ),
        );
      }
    }

    // 3. Create FormData
    final formData = FormData.fromMap({
      'email': email,
      'password': passwordcontroller.text,
      'name': name,
      'gender': gender,
      'bio': biocontroller.text,
      'nationality': nationality,
      'profession': profession,
      'linkedIn': linkedin,
      'instagram': instagram,
      'age':age.toString(),
      // Safe access using ! because we checked for nulls at the top
      'avatar': await MultipartFile.fromFile(
        profileImage.value!.path,
        filename: profileImage.value!.name,
        contentType: MediaType('image', 'png'),
      ),
      // 'cover': await MultipartFile.fromFile(
      //   coverImage.value!.path,
      //   filename: coverImage.value!.name,
      //   contentType: MediaType('image', 'png'),
      // ),
      'galleryPhotos': galleryFiles, // Pass the List directly
    });

    // 4. API Call
    final response = await _client.postFormData(
      url: '${ApiConfig.baseUrl}/api/v1/user/sign-up',
      data: formData,
    );

    print('✅ User Created: ${response.data}');
    Get.snackbar('Success', 'User Created Successfully');
    Get.toNamed(AppPages.subscription);
    
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
  }
  finally{
    isLoading.value=false;
  }
}
}
