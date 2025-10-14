import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/common_widgets/update_info_field.dart';
import 'package:mementum/modules/home/home_controller.dart';
import 'package:mementum/modules/memories/memories_controller.dart';
import 'package:mementum/utils/app_colors.dart';
import 'package:mementum/utils/app_images.dart';

class MemoriesView extends GetView<MemoriesController> {
  const MemoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F7F1),
      body: SafeArea(
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
                      child: Image.asset(
                        AppImages.back_icon,
                        height: Get.height * 0.07,
                        width: Get.height * 0.07,
                      ),
                    ),
                    Center(
                      child: Text(
                        'Memories',
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
              SizedBox(height: Get.height * 0.01),
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => controller.setDepositType(0),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: controller.memorytype.value == 0
                                ? AppColors.primarycolor
                                : Color(0xffC7C7C7),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              "Create Event",
                              style: TextStyle(
                                color: controller.memorytype.value == 0
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => controller.setDepositType(1),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: controller.memorytype.value == 1
                                ? AppColors.primarycolor
                                : Color(0xffC7C7C7),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              "Planned",
                              style: TextStyle(
                                color: controller.memorytype.value == 1
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() {
                  if (controller.memorytype == 0) {
                    return _createEvent();
                  } else {
                    return _plannedevent();
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Widget _createEvent (){
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Get.height*0.02,),
        UpdateInfoField(tittle: "Event Name", hint:'Enter event name'),
                SizedBox(height: Get.height*0.02,),
        UpdateInfoField(tittle: "Participants", hint:'Enter number of participants'),
                SizedBox(height: Get.height*0.02,),
        UpdateInfoField(tittle: "Event Location", hint:'Enter event Location'),
                SizedBox(height: Get.height*0.02,),
        UpdateInfoField(tittle: "Event Date", hint:'Enter event Date'),
                SizedBox(height: Get.height*0.02,),
        UpdateInfoField(tittle: "Event Category", hint:'Enter event category name'),
        SizedBox(height: Get.height*0.02,),
        Text('Image',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.black
        ),
        
        ),
        SizedBox(height: Get.height*0.02,),
        Container(
          height: Get.height*0.08,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Color(0xff625B4A)
            ),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white
          ),
          child: Center(
            child: Text('Upload image',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.primarycolor
            ),
            ),
          ),
        ),
        SizedBox(height: Get.height*0.02,),
        Text('Image',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.black
        ),
        
        ),
        SizedBox(height: Get.height*0.02,),
        Container(
          height: Get.height*0.11,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Color(0xff625B4A)
            ),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white
          ),
          child: Center(
            child: Text('Write a short and detailed description of the event',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.primarycolor
            ),
            ),
          ),
        ),
        SizedBox(height: Get.height*0.05,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: Get.height*0.07,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: Color(0xffDACBA4)
            ),
            child: Center(child: Text('Create'))),
        )
      ],
    )
  );
}

Widget _plannedevent (){
  final controller=Get.find<HomeController>();
  return Column(
    children: [
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
                          child: Container(
                            height: Get.height * 0.2,
                            decoration: BoxDecoration(
                              color: Color(0xffF4EFE3B2).withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
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
                                SizedBox(height: 5),
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
                                      SizedBox(width: Get.width*0.01,),
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
                                       SizedBox(width: Get.width*0.01,),
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
                          ),
                        );
                      },
                    ),
                  ),
                ),
    ],
  );
}