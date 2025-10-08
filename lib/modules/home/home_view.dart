import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mementum/common_widgets/textfield.dart';
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
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                      Icon(Icons.circle_notifications_outlined, size: 40),
                    ],
                  ),
                  Container(
                    height: Get.height * 0.07,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Commontextfield(
                      tittle: "Search",
                      obsecuretext: false,
                      icon: Icon(Icons.search),
                    ),
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
                              color: Color(0xffF4EFE3B2).withOpacity(0.7),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
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
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize:14,
                                  color: Colors.black
                                ),)
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
