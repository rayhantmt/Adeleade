import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';
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
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              children: [
                SizedBox(height: Get.height*0.07,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      AppImages.logo,
                      height: 40,
                      width: 40,
                      color: Colors.black,
                    ),
                    Text('Momentum',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 24
                    ),
                    ),
                    Icon(Icons.circle_notifications_outlined,
                    size: 40,
                    )
                  ],
                ),
                Container(
                  height: Get.height*0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Commontextfield(tittle: "Search", obsecuretext: false,icon: Icon(Icons.search),)
                ),
                SizedBox(height: Get.height*0.01,),
                Text(controller.events.toList().first.date_time.toString())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
