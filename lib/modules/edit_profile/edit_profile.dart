import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/common_widgets/edit_profile_info.dart';
import 'package:mementum/routes/app_pages.dart';
import 'package:mementum/utils/app_images.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final storage=GetStorage();
    final profilename=storage.read('name');//.toString().toUpperCase();
    final profilephoto=storage.read('photoURL');
    final coverphoto =storage.read('coverPhotoURL');
    final email=storage.read('email');
    final gender=storage.read('gender');
    final nationality=storage.read('nationality');
    final instagram=storage.read('instagram');
    final linkedin=storage.read('linkedIn');
    final bio=storage.read('bio');
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
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              'Edit Profile',
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
                    SizedBox(height: Get.height * 0.02),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Cover Photo
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              coverphoto,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        // ✅ Edit Icon for COVER PHOTO (Top Right)
                        Positioned(
                          top: 10, // 10px from top of cover photo
                          right: 10, // 10px from right edge
                          child: GestureDetector(
                            onTap: () {
                              // Handle cover photo edit
                              print('Edit cover photo');
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                size: 20,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        // Profile Picture (Overlapping)
                        Positioned(
                          bottom: -Get.height * 0.07,
                          left: Get.width * 0.5 - Get.height * 0.1,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 4),
                            ),
                            child: CircleAvatar(
                              radius: Get.height * 0.07,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(profilephoto?? "https://via.placeholder.com/150"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => Get.toNamed(AppPages.updateinfo),
                          child: Image.asset(
                            AppImages.editprofileicon,
                            height: Get.height * 0.07,
                            width: Get.width * 0.07,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          (profilename??"Error loading name").toString().toUpperCase(),
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    EditProfileInfo(tittle: 'Name', info: (profilename??'Error loading name').toString().toUpperCase()),
                    SizedBox(height: Get.height * 0.01),
                    EditProfileInfo(
                      tittle: 'Email',
                      info: (email??"Error loading email").toString().toLowerCase(),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    EditProfileInfo(tittle: 'Gender', info: (gender??"Error loading gender").toString().toUpperCase()),
                    // SizedBox(height: Get.height * 0.01),
                    // EditProfileInfo(tittle: 'Age', info: (age??"Error loading age")),
                    SizedBox(height: Get.height * 0.01),
                    EditProfileInfo(tittle: 'Nationality', info: (nationality?? "Error loading nationality").toString().toUpperCase()),
                    SizedBox(height: Get.height * 0.01),
                    EditProfileInfo(
                      tittle: 'Instagram',
                      info: (instagram?? "Error loading instagram link").toString(),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    EditProfileInfo(
                      tittle: 'Linkedin',
                      info: linkedin??"Error loading instagram link",
                    ),
                    SizedBox(height: Get.height * 0.01),
                    EditProfileInfo(
                      tittle: 'Bio',
                      info:
                          (bio?? "Error loading bio").toString().toUpperCase(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
