// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:mementum/utils/app_images.dart';

// class MapsView extends StatefulWidget {
//   const MapsView({super.key});

//   @override
//   State<MapsView> createState() => _MapsViewState();
// }

// class _MapsViewState extends State<MapsView> {
//   late GoogleMapController mapController;
//   final LatLng _center = const LatLng(21.7947, 90.3870);
//     final Set<Marker> _markers = {
//     const Marker(
//       markerId: MarkerId('water_garden'),
//       position: LatLng(23.8675, 90.3878),
//       infoWindow: InfoWindow(title: 'Water Garden Restaurant', snippet: 'Event Venue'),
//     ),
//     const Marker(
//       markerId: MarkerId('dine_hill'),
//       position: LatLng(23.7943, 90.3876),
//       infoWindow: InfoWindow(title: 'The Dine Hill Restaurant', snippet: 'Party Center'),
//     ),
//     const Marker(
//       markerId: MarkerId('food_place'),
//       position: LatLng(23.7962, 90.3874),
//       infoWindow: InfoWindow(title: 'FoodPlace Restaurant', snippet: 'Local Eatery'),
//     ),
//   };
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Image.asset(
//             AppImages.background,
//             height: double.infinity,
//             width: double.infinity,
//             fit: BoxFit.cover,
//           ),
//           SafeArea(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,

//               children: [
//                 SizedBox(height: Get.height * 0.02, width: double.infinity),
//                 Text(
//                   'Memories Happening near you',
//                   style: GoogleFonts.inter(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 18,
//                     color: Colors.black,
//                   ),
//                 ),

//                 Expanded(
//                   child: GoogleMap(
//                     onMapCreated: (GoogleMapController controller) {
//                       mapController = controller;
//                     },
//                     initialCameraPosition: CameraPosition(
//                       target: _center,
//                       zoom: 15.0,
//                     ),
//                      markers: _markers,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// // import 'package:flutter/material.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';

// // class MapsView extends StatefulWidget {
// //   @override
// //   _MapsViewState createState() => _MapsViewState();
// // }

// // class _MapsViewState extends State<MapsView> {
// //   late GoogleMapController mapController;

// //   // Initial camera position centered near Ibrahimpur, Dhaka
// //   final LatLng _center = const LatLng(23.7940, 90.3870);

// //   final Set<Marker> _markers = {
// //     const Marker(
// //       markerId: MarkerId('water_garden'),
// //       position: LatLng(23.7962, 90.3878),
// //       infoWindow: InfoWindow(title: 'Water Garden Restaurant', snippet: 'Event Venue'),
// //     ),
// //     const Marker(
// //       markerId: MarkerId('dine_hill'),
// //       position: LatLng(23.7943, 90.3876),
// //       infoWindow: InfoWindow(title: 'The Dine Hill Restaurant', snippet: 'Party Center'),
// //     ),
// //     const Marker(
// //       markerId: MarkerId('food_place'),
// //       position: LatLng(23.7962, 90.3874),
// //       infoWindow: InfoWindow(title: 'FoodPlace Restaurant', snippet: 'Local Eatery'),
// //     ),
// //   };

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Maps Events'),
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back_ios),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //       ),
// //       body: GoogleMap(
// //         onMapCreated: (GoogleMapController controller) {
// //           mapController = controller;
// //         },
// //         initialCameraPosition: CameraPosition(
// //           target: _center,
// //           zoom: 15.0,

// //         ),
// //         markers: _markers,
// //       ),
// //     );
// //   }
// // }import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mementum/modules/home/home_controller.dart';
import 'package:mementum/modules/maps/maps_controller.dart';
import 'package:mementum/utils/app_images.dart';

class MapsView extends StatefulWidget {
  const MapsView({super.key});

  @override
  State<MapsView> createState() => _MapsViewState();
}

final locatecontroller = Get.find<MapsController>();
final eventcontroller = Get.find<HomeController>();

class _MapsViewState extends State<MapsView> {
  late GoogleMapController mapController;

  LatLng _center = LatLng(
    locatecontroller.latitude,
    locatecontroller.longitude,
  ); // Default center
  bool _isLoading = false;

  // final Set<Marker> _markers = {
  //   const Marker(
  //     markerId: MarkerId('water_garden'),

  //     position: LatLng(26.024797278890443, 88.47026746720076),
  //     infoWindow: InfoWindow(
  //       title: 'Water Garden Restaurant',
  //       snippet: 'Event Venue',
  //     ),
  //   ),
  //   const Marker(
  //     markerId: MarkerId('dine_hill'),
  //     position: LatLng(26.024797278890443, 88.47026746720076),
  //     infoWindow: InfoWindow(
  //       title: 'The Dine Hill Restaurant',
  //       snippet: 'Party Center',
  //     ),
  //   ),
  //   const Marker(
  //     markerId: MarkerId('food_place'),
  //     position: LatLng(226.024797278890443, 88.47026746720076),
  //     infoWindow: InfoWindow(
  //       title: 'FoodPlace Restaurant',
  //       snippet: 'Local Eatery',
  //     ),
  //   ),
  // };

  @override
  void initState() {
    super.initState();
    //_getCurrentLocation();
    locatecontroller.getCurrentLocation();
  }

  // Future<void> _getCurrentLocation() async {
  //   try {
  //     // Check if location services are enabled
  //     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //     if (!serviceEnabled) {
  //       setState(() => _isLoading = false);
  //       Get.snackbar(
  //         'Location Services Disabled',
  //         'Please enable location services',
  //         snackPosition: SnackPosition.BOTTOM,
  //       );
  //       return;
  //     }

  //     // Check location permissions
  //     LocationPermission permission = await Geolocator.checkPermission();
  //     if (permission == LocationPermission.denied) {
  //       permission = await Geolocator.requestPermission();
  //       if (permission == LocationPermission.denied) {
  //         setState(() => _isLoading = false);
  //         Get.snackbar(
  //           'Permission Denied',
  //           'Location permission is required',
  //           snackPosition: SnackPosition.BOTTOM,
  //         );
  //         return;
  //       }
  //     }

  //     if (permission == LocationPermission.deniedForever) {
  //       setState(() => _isLoading = false);
  //       Get.snackbar(
  //         'Permission Denied',
  //         'Location permissions are permanently denied',
  //         snackPosition: SnackPosition.BOTTOM,
  //       );
  //       return;
  //     }

  //     // Get current position
  //     Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high,
  //     );

  //     setState(() {
  //       _center = LatLng(position.latitude, position.longitude);
  //       _isLoading = false;
  //     });

  //     // Move camera to current location
  //     if (mapController != null) {
  //       mapController.animateCamera(
  //         CameraUpdate.newLatLng(_center),
  //       );
  //     }
  //   } catch (e) {
  //     setState(() => _isLoading = false);
  //     Get.snackbar(
  //       'Error',
  //       'Failed to get location: $e',
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.background,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Get.height * 0.02, width: double.infinity),
                Text(
                  'Memories near you',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: Get.height*0.021,),
                Expanded(
                  child: _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : GoogleMap(
                          onMapCreated: (GoogleMapController controller) {
                            mapController = controller;
                          },
                          initialCameraPosition: CameraPosition(
                            target: _center,
                            zoom: 15.0,
                          ),
                          markers: eventcontroller.markers,
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
