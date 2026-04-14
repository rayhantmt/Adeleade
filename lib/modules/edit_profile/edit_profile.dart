import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/common_widgets/edit_profile_info.dart';
import 'package:mementum/global_service.dart';
import 'package:mementum/modules/edit_profile/edit_profile_controller.dart';
import 'package:mementum/routes/app_pages.dart';
import 'package:mementum/utils/app_images.dart';

class EditProfile extends GetView<EditProfileController> {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
     //.toString().toUpperCase();
      final ss=Get.find<GlobalService>();
    final profilephoto = storage.read('photoURL');
    final coverphoto =
        storage.read('coverPhotoURL') ?? 'Please upload a cover photo';
    final email = storage.read('email');
    final gender = storage.read('gender');
    final nationality = ss.nationality.value;
    final instagram = ss.instagram.value;
    final linkedin = ss.linkedin.value;
    final bio = ss.bio.value;

 
 
final profilename = ss.name.value;
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
                            child: coverphoto.startsWith('http')
                                ? Image.network(
                                    coverphoto,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    // Handle cases where the URL exists but is broken
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                              color: Colors.grey[200],
                                              child: const Center(
                                                child: Text(
                                                  "Error loading image",
                                                ),
                                              ),
                                            ),
                                  )
                                : Container(
                                    color: Colors
                                        .grey[200], // Background for the "empty" state
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add_a_photo_outlined,
                                          color: Colors.grey[600],
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          coverphoto, // This will display 'Please upload a cover photo'
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
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
                              controller.pickCoverImage();
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
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 4,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: Get.height * 0.07,
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(
                                    profilephoto ??
                                        "https://via.placeholder.com/150",
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.pickprofileImage();
                                    // print('dudu');
                                  },
                                  child: Container(
                                    color: Colors.black,
                                    child: Icon(
                                      Icons.camera_alt,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                          (profilename ?? "Error loading name")
                              .toString()
                              .toUpperCase(),
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    EditProfileInfo(
                      tittle: 'Name',
                      info: (profilename ?? 'Error loading name')
                          .toString()
                          .toUpperCase(),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    EditProfileInfo(
                      tittle: 'Email',
                      info: (email ?? "Error loading email")
                          .toString()
                          .toLowerCase(),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    EditProfileInfo(
                      tittle: 'Gender',
                      info: (gender ?? "Error loading gender")
                          .toString()
                          .toUpperCase(),
                    ),
                    // SizedBox(height: Get.height * 0.01),
                    // EditProfileInfo(tittle: 'Age', info: (age??"Error loading age")),
                    SizedBox(height: Get.height * 0.01),
                    EditProfileInfo(
                      tittle: 'Nationality',
                      info: (nationality ?? "Error loading nationality")
                          .toString()
                          .toUpperCase(),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    EditProfileInfo(
                      tittle: 'Instagram',
                      info: (instagram ?? "Error loading instagram link")
                          .toString(),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    EditProfileInfo(
                      tittle: 'Linkedin',
                      info: linkedin ?? "Error loading instagram link",
                    ),
                    SizedBox(height: Get.height * 0.01),
                    EditProfileInfo(
                      tittle: 'Bio',
                      info: (bio ?? "Error loading bio")
                          .toString()
                          .toUpperCase(),
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
