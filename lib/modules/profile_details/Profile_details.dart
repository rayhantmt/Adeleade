import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/modules/profile_details/profile_controller.dart';
import 'package:mementum/utils/app_colors.dart';
import 'package:mementum/utils/app_images.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileDetails extends GetView<ProfileController> {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getchatroomid();
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
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primarycolor,
                    ),
                  );
                }

                final user = controller.userData.value;
                if (user == null) {
                  return Center(
                    child: Text(
                      'Failed to load profile',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  );
                }

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.07,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
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
                                user.name.toUpperCase(),
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
                      SizedBox(
                        height: Get.height * 0.25,
                        child: user.photoURL.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: user.photoURL,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Image.asset(AppImages.profilephoto),
                              )
                            : Image.asset(AppImages.profilephoto),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Handle Instagram link
                              if (user.instagram.isNotEmpty) {
                                // Launch URL
                              }
                            },
                            child: Image.asset(
                              AppImages.instagram_logo,
                              height: Get.height * 0.1,
                              width: Get.width * 0.1,
                            ),
                          ),
                          SizedBox(width: Get.width * 0.05),
                          GestureDetector(
                            onTap: () {
                              // Handle LinkedIn link
                              if (user.linkedIn.isNotEmpty) {
                                // Launch URL
                              }
                            },
                            child: Image.asset(
                              AppImages.linked_in_logo,
                              height: Get.height * 0.1,
                              width: Get.width * 0.1,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Column(
                          //   children: [
                          //     Text(
                          //       'Age',
                          //       style: GoogleFonts.inter(
                          //         fontWeight: FontWeight.w500,
                          //         fontSize: 16,
                          //         color: Color(0xff898989),
                          //       ),
                          //     ),
                          //     Text(
                          //       controller.calculateAge().toString(),
                          //       style: GoogleFonts.inter(
                          //         fontWeight: FontWeight.w500,
                          //         fontSize: 16,
                          //         color: Color(0xff1E1E1E),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          Column(
                            children: [
                              Text(
                                'Gender',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xff898989),
                                ),
                              ),
                              Text(
                                user.gender.toUpperCase(),
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xff1E1E1E),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Nationality',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xff898989),
                                ),
                              ),
                              Text(
                                user.nationality.toUpperCase(),
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xff1E1E1E),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => controller.sendconnectionrequest(),
                            child: Obx(
                              () => controller.isConnecting.value
                                  ? CircularProgressIndicator()
                                  : Container(
                                      height: Get.height * 0.05,
                                      width: Get.width * 0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(99),
                                        color: AppColors.primarycolor,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Connect',
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          Container(
                            height: Get.height * 0.05,
                            width: Get.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(99),
                              color: AppColors.primarycolor,
                            ),
                            child: Center(
                              child: Text(
                                'Chat',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bio',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xff1E1E1E),
                            ),
                          ),
                          Text(
                            user.bio.isNotEmpty
                                ? user.bio.toUpperCase()
                                : 'No bio available',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xff898989),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.02),
                          Text(
                            'Gallery',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color(0xff1E1E1E),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.02),
                          SizedBox(
                            height: Get.height * 0.2,
                            child: controller.gallery.isEmpty
                                ? Center(
                                    child: Text(
                                      'No gallery photos',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: Color(0xff898989),
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.gallery.length,
                                    itemBuilder: (context, index) {
                                      final data = controller.gallery[index];
                                      return Container(
                                        height: Get.height * 0.2,
                                        width: Get.width * 0.3,
                                        margin: EdgeInsets.only(right: 10),
                                        child: data.image.startsWith('http')
                                            ? CachedNetworkImage(
                                                imageUrl: data.image,
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              )
                                            : Image.asset(
                                                data.image,
                                                fit: BoxFit.cover,
                                              ),
                                      );
                                    },
                                  ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
