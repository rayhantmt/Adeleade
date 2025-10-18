import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/modules/home/home_controller.dart';
import 'package:mementum/routes/app_pages.dart';
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
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppPages.notification),
                      child: Image.asset(
                        AppImages.notification_logo,
                        height: Get.height * 0.08,
                        width: Get.width * 0.1,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: Get.height * 0.055,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hint: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.search_icon,
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(width: Get.width * 0.01),
                          Text(
                            'Search',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xff7D848D),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: Get.height * 0.045,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.ctgry.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () => controller.selectCategory(index),
                          child: Obx(
                            () => Container(
                              height: Get.height * 0.05,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    controller.selectedCategoryIndex.value ==
                                        index
                                    ? Color(0xffDACBA4)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black12),
                              ),
                              child: Text(
                                controller.ctgry[index].categories,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Expanded(
                  child: Obx(
                    () => GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: controller.events.length,

                      itemBuilder: (context, index) {
                        final data = controller.events[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () => Get.toNamed(AppPages.eventdetails),
                            child: Container(
                              height: Get.height * 0.2,
                              decoration: BoxDecoration(
                                color: Color(0xffF4EFE3B2).withOpacity(0.3),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 50,
                                    right: 50,
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color(0xffF4EFE3),
                                      ),
                                      child: Text(
                                        data.maxpeople,
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                            
                                      // SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 7),
                                        child: Text(
                                          data.tittle,
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 7),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              AppImages.calander_icon,
                                              height: Get.height * 0.03,
                                              width: Get.width * 0.05,
                                            ),
                                            // SizedBox(width: Get.width * 0.01),
                                            Text(
                                              data.date_time,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: Color(0xff898989),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 7),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              AppImages.location_icon,
                                              height: Get.height * 0.03,
                                              width: Get.width * 0.05,
                                            ),
                                            SizedBox(width: Get.width * 0.01),
                                            Text(
                                              data.location,
                            
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: Color(0xff898989),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
