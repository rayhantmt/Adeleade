import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mementum/api/api_config.dart';
import 'package:mementum/api/api_services.dart';
import 'package:mementum/core/exceptions.dart';
import 'package:mementum/modules/connection_requests/connection_request_model.dart';

class ConnectionRequestController extends GetxController {
  // In your controller
  RxBool isLoading=false.obs;
   List<ConnectionRequest> requests = RxList<ConnectionRequest>();
  Future<void> fetchConnectionRequests( String name) async {
    isLoading.value=true;
    final token=GetStorage().read('token');
    try {
      final response = await ApiService.get(
        endpoint: ApiConfig.getrecievedRequests,
        headers: {
          'Authorization':token
        }
      ); // adjust endpoint

      if (response != null && response['success'] == true) {
        final connectionResponse = ConnectionRequestResponse.fromJson(response);

        // Access the data
        requests = connectionResponse.data.requests;
       // final count = connectionResponse.data.count;
       // print(response.toString());
        // Use in your UI
        
      } else {
        throw Exception('Failed to load events');
      }
    } on BadRequestException catch (e) {
      Get.snackbar('Error', e.message, snackPosition: SnackPosition.BOTTOM);
    } on UnauthorizedException catch (e) {
      Get.snackbar(
        'Unauthorized',
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } on NotFoundException catch (e) {
      Get.snackbar('Not Found', e.message, snackPosition: SnackPosition.BOTTOM);
    } on InternalServerException catch (e) {
      Get.snackbar(
        'Server Error',
        '$e Please try again later.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FetchDataException catch (e) {
      Get.snackbar(
        'Error',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print('Error: $e');
    }
    finally{
      isLoading.value=false;
    }
  }
}
