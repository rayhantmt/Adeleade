import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class MapsController extends GetxController {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar(
          'Location Services Disabled',
          'Please enable location services',
          snackPosition: SnackPosition.TOP,
        );
        Geolocator.openLocationSettings();
        return;
      }

      // Check location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar(
            'Permission Denied',
            'Location permission is required',
            snackPosition: SnackPosition.TOP,
          );
          Geolocator.openLocationSettings();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Get.snackbar(
          'Permission Denied',
          'Location permissions are permanently denied',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      latitude = position.latitude;
      longitude = position.longitude;
Get.snackbar('Success','Your location fetched successfully');
      print('Latitude: $latitude, Longitude: $longitude');
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to get location: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}