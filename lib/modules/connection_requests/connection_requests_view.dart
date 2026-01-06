import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/modules/connection_requests/connection_request_controller.dart';
import 'package:mementum/utils/app_images.dart';

class ConnectionRequestsView extends GetView<ConnectionRequestController> {
  const ConnectionRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fetchConnectionRequests();
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.07,
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: GestureDetector(
                            onTap: () => Get.back(),
                            child: Image.asset(
                              AppImages.back_icon,
                              height: Get.height * 0.07,
                              width: Get.height * 0.07,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Connection Requests',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height*0.05,),
                 Expanded(
                   child: ListView.builder(
                    itemCount: controller.requests.length,
                    itemBuilder: (context, index) {
                     return Container(
                   height: 30,
                   width: 30,
                   child: Column(
                     children: [
                       Row(
                         children: [
                          Image.network(controller.requests[index].userId.photoURL,
                          height: 30,
                          width: 30,
                          ),
                           Text(controller.requests[index].userId.name.toString()),
                         ],
                       ),
                     ],
                   ),
                     );
                   },),
                 )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
