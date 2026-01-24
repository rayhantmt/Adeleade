import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mementum/utils/app_images.dart';

class MapsView extends StatefulWidget {
  const MapsView({super.key});

  @override
  State<MapsView> createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(23.7940, 90.3870);
    final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId('water_garden'),
      position: LatLng(23.7962, 90.3878),
      infoWindow: InfoWindow(title: 'Water Garden Restaurant', snippet: 'Event Venue'),
    ),
    const Marker(
      markerId: MarkerId('dine_hill'),
      position: LatLng(23.7943, 90.3876),
      infoWindow: InfoWindow(title: 'The Dine Hill Restaurant', snippet: 'Party Center'),
    ),
    const Marker(
      markerId: MarkerId('food_place'),
      position: LatLng(23.7962, 90.3874),
      infoWindow: InfoWindow(title: 'FoodPlace Restaurant', snippet: 'Local Eatery'),
    ),
  };
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
                  'Memories Happening near you',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                
                Expanded(
                  child: GoogleMap(
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                    },
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 15.0,
                    ),
                     markers: _markers,
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
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapsView extends StatefulWidget {
//   @override
//   _MapsViewState createState() => _MapsViewState();
// }

// class _MapsViewState extends State<MapsView> {
//   late GoogleMapController mapController;

//   // Initial camera position centered near Ibrahimpur, Dhaka
//   final LatLng _center = const LatLng(23.7940, 90.3870);

//   final Set<Marker> _markers = {
//     const Marker(
//       markerId: MarkerId('water_garden'),
//       position: LatLng(23.7962, 90.3878),
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
//       appBar: AppBar(
//         title: const Text('Maps Events'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: GoogleMap(
//         onMapCreated: (GoogleMapController controller) {
//           mapController = controller;
//         },
//         initialCameraPosition: CameraPosition(
//           target: _center,
//           zoom: 15.0,
         
//         ),
//         markers: _markers,
//       ),
//     );
//   }
// }