import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mementum/api/api_config.dart';
import 'package:mementum/api/api_services.dart';
import 'package:mementum/core/exceptions.dart';
import 'package:mementum/modules/home/home_model.dart';

class HomeController extends GetxController{


  var ctgry=[
Category(categories: 'All',),
Category(categories: 'Teavelling'),
Category(categories: 'Music'),
Category(categories: 'Mountain'),
Category(categories: 'Sea'),
Category(categories: 'Lake'),
Category(categories: 'Spritual')
  ].obs;
  // Add this variable
var selectedCategoryIndex = 0.obs;

// Add this function
void selectCategory(int index) {
  selectedCategoryIndex.value = index;
}
void printToken() {
  final storage = GetStorage();
  final token = storage.read('token'); // read the saved token
  print('Saved Token: $token'); // prints it
}
var isLoading = false.obs;
  var events = <Event>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    final storage = GetStorage();
  final token = storage.read('token'); 
    isLoading.value = true;
    try {
      final response = await ApiService.get(
        endpoint: ApiConfig.eventsEndpoint,
        headers: {
          'Authorization':token
        }
      );

      if (response['success'] == true) {
        final List<dynamic> eventsJson = response['data']['events'];
        events.value = eventsJson.map((json) => Event.fromJson(json)).toList();
        
        Get.snackbar(
          'Success',
          response['message'] ?? 'Events loaded successfully',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        throw Exception('Failed to load events');
      }
    } on BadRequestException catch (e) {
      Get.snackbar(
        'Error',
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } on UnauthorizedException catch (e) {
      Get.snackbar(
        'Unauthorized',
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } on NotFoundException catch (e) {
      Get.snackbar(
        'Not Found',
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } on InternalServerException catch (e) {
      Get.snackbar(
        'Server Error',
        'Something went wrong. $e Please try again later.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FetchDataException catch (e) {
      Get.snackbar(
        'Network Error',
        'Please check your internet connection $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'An unexpected error occurred',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Refresh events
  Future<void> refreshEvents() async {
    await fetchEvents();
  }



}