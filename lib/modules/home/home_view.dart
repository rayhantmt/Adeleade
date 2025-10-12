import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/modules/home/home_controller.dart';

import 'package:mementum/utils/app_images.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

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
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Get.height * 0.07),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        AppImages.logo,
                        height: 40,
                        width: 40,
                        color: Colors.black,
                      ),
                      Text(
                        'Momentum',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 24,
                        )
                      ),
                      Image.asset(AppImages.notification_logo,
                      height: Get.height*0.08,
                      width: Get.width*0.1,
                      )
                    ],
                  ),
                  Container(
                    height: Get.height * 0.055,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 20,),
                          child: Row(
                            children: [
                              Icon(Icons.search,
                              size: 30,
                              color: Color(0xff7D848D),
                              ),
                              Text('Search',
                              style:GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xff7D848D)
                              ),
                              )
                            ],
                          ),
                        )
                      ),
                    )
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Obx(
                    () => GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: controller.events.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final data = controller.events[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffF4EFE3B2).withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadiusGeometry.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  child: Image.asset(
                                    data.image,
                                    height: Get.height * 0.1,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(data.tittle,
                                textAlign: TextAlign.start,
                                style: GoogleFonts.inter(fontWeight: FontWeight.w500,
                                  fontSize:14,
                                  color: Colors.black,
                                  )),
                                Row(
                                  children: [
                                    Image.asset(AppImages.calander_icon,
                                    height: Get.height*0.03,
                                    width: Get.width*0.05,
                                    ),
                                    Text(data.date_time,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Color(0xff898989)
                                    ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(AppImages.location_icon,
                                    height: Get.height*0.03,
                                    width: Get.width*0.05,
                                    ),
                                    Text(data.location,
                                    
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Color(0xff898989)
                                    ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
