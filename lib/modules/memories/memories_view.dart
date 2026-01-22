import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/common_widgets/date_picking_field.dart';
import 'package:mementum/common_widgets/update_info_dropdown.dart';
import 'package:mementum/common_widgets/update_info_field.dart';
import 'package:mementum/modules/memories/memories_controller.dart';
import 'package:mementum/routes/app_pages.dart';
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
                    // Align(
                    //   alignment: AlignmentGeometry.centerLeft,
                    //   child: Image.asset(
                    //     AppImages.back_icon,
                    //     height: Get.height * 0.07,
                    //     width: Get.height * 0.07,
                    //   ),
                    // ),
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
                              "New Activity",
                              style: TextStyle(
                                color: controller.memorytype.value == 0
                                    ? Colors.black
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
                                    ? Colors.black
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
                        onTap: () => controller.setDepositType(2),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            color: controller.memorytype.value == 2
                                ? AppColors.primarycolor
                                : Color(0xffC7C7C7),
                          ),
                          child: Center(child: Text('Connections')),
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
                  } else if (controller.memorytype == 1) {
                    return _plannedevent();
                  } else
                    return _memories();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _createEvent() {
  final controller = MemoriesController();
  final List<String> categories = [
    "Sports",
    "Music",
    "Art",
    "Technology",
    "Food",
    "Education",
    "Business",
    "Health",
    "Travel",
    "Social",
    "Other",
  ];
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Get.height * 0.02),
        UpdateInfoField(
          tittle: "Activity Name",
          hint: 'Enter Activity name',
          textcontroller: controller.namecontroller,
        ),
        SizedBox(height: Get.height * 0.02),
        // UpdateInfoField(
        //   textcontroller: controller.maxParticipantscontroller,
        //   tittle: "Participants",
        //   hint: 'Enter number of participants',
        // ),
        Obx(
          () => Container(
            height: Get.height * 0.05,
            width: Get.width * 0.7,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color(0xffEDF1F3)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                hint: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Enter number of participants',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xff1A1C1E),
                    ),
                  ),
                ),
                value: controller.selectedParticipants.value == 0
                    ? null
                    : controller.selectedParticipants.value,
                isExpanded: true,
                icon: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xff1A1C1E),
                  ),
                ),
                padding: EdgeInsets.only(left: 10),
                items: controller.participantsList
                    .map(
                      (participants) => DropdownMenuItem<int>(
                        
                        value: participants,
                        child: Text(
                          participants.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xff1A1C1E),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedParticipants.value = value;
                    controller.maxParticipantscontroller.text = value
                        .toString();
                  }
                },
                selectedItemBuilder: (BuildContext context) {
                  return controller.participantsList.map((participants) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        participants.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xff1A1C1E),
                        ),
                      ),
                    );
                  }).toList();
                },
              ),
            ),
          ),
        ),
        SizedBox(height: Get.height * 0.02),
        UpdateInfoField(
          textcontroller: controller.locationcontroller,
          tittle: "Activity Location",
          hint: 'Enter Activity Location',
        ),
        SizedBox(height: Get.height * 0.02),
        // UpdateInfoField(
        //   tittle: "Activity Date",
        //   hint: 'Enter Activity Date',
        //   textcontroller: controller.eventdatecontroller,
        // ),
        DatePickerField(
          tittle: 'Activity Date',
          hint: 'Select Activity Date',
          textcontroller: controller.eventdatecontroller,
        ),
        SizedBox(height: Get.height * 0.02),
        // UpdateInfoField(
        //   textcontroller: controller.cetegorycontroller,
        //   tittle: "Activity Category",
        //   hint: 'Enter Activity category name',
        // ),
        // 1. Define your categories list

        // 2. Use the new widget
        UpdateInfoDropdown(
          textcontroller: controller.cetegorycontroller,
          tittle: "Activity Category",
          hint: 'Select Category',
          items: categories, // Pass the list here
        ),
        SizedBox(height: Get.height * 0.02),
        Text(
          'Image',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        SizedBox(height: Get.height * 0.02),
        GestureDetector(
          onTap: controller.pickEventImage,
          child: Obx(
            () => controller.eventImage.value != null
                ? Image.file(File(controller.eventImage.value!.path))
                : Container(
                    height: Get.height * 0.08,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xff625B4A)),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        'Upload image',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.primarycolor,
                        ),
                      ),
                    ),
                  ),
          ),
        ),
        SizedBox(height: Get.height * 0.02),
        Text(
          'Details',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        SizedBox(height: Get.height * 0.02),
        Container(
          height: Get.height * 0.11,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xff625B4A)),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: controller.detailscontroller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hint: Center(
                  child: Text(
                    'Write a short and detailed description of the event',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.primarycolor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: Get.height * 0.05),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: controller.createEvent,
            //onTap: () => print(controller.cetegorycontroller.text.toString()),
            child: Container(
              height: Get.height * 0.07,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99),
                color: Color(0xffDACBA4),
              ),
              child: Center(
                child: Obx(
                  () => controller.isLoading.value
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text('Create'),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _plannedevent() {
  final controller = Get.find<MemoriesController>();
  //controller.fetchmmyEvents();
  return Column(
    children: [
      Expanded(
        child: Obx(
          () => GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: controller.myevents.length,

            itemBuilder: (context, index) {
              final data = controller.myevents[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => Get.toNamed(
                    AppPages.eventdetails,
                    arguments: {
                      'image': data.image,
                      'tittle': data.title,
                      'location': data.location,
                      'time': data.formattedDate,
                      'joinedpeople': data.joinedPeople,
                      'eventDeatils': data.details,
                      'hostedby': data.organizerName,
                      'hostphotourl': data.organizerPhoto,
                      'maxpeople': data.maxPeople,
                      'id': data.id,
                      'perticanpants': data.participants,
                    },
                  ),
                  child: Container(
                    height: Get.height * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                          child: Stack(
                            children: [
                              Image.network(
                                data.image,
                                height: Get.height * 0.1,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 5,

                                          top: 5,
                                        ),
                                        child: Container(
                                          height: Get.height * 0.025,
                                          width: Get.width * 0.14,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              99,
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                AppImages.personlogo,
                                                height: Get.height * 0.02,
                                                width: Get.width * 0.04,
                                              ),
                                              Text(
                                                '${data.joinedPeople}/${data.maxPeople}',
                                                style: GoogleFonts.inter(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: Text(
                            data.title,
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
                              Text(
                                data.title,
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
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
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
                ),
              );
            },
          ),
        ),
      ),
    ],
  );
}

Widget _memories() {
  final controller = Get.find<MemoriesController>();
  return Column(
    children: [
      Text(
        'Your All connections',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      SizedBox(height: Get.height * 0.05),
      Expanded(
        child: ListView.builder(
          itemCount: controller.connections.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => Get.toNamed(
              AppPages.profile_details,
              arguments: {'id': controller.connections[index].user.id},
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(99),
                  child: Image.network(
                    controller.connections[index].user.photoURL,
                    height: Get.height * 0.1,
                    width: Get.width * 0.25,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: Get.width * 0.05),
                Text(
                  controller.connections[index].user.name.toUpperCase(),
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
