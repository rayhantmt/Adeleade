import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/common_widgets/profile_container.dart';
import 'package:mementum/routes/app_pages.dart';
import 'package:mementum/utils/app_images.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F7F1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        'My Profile',
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

              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.all(
                      Radius.circular(100),
                    ),
                    child: Image.asset(
                      AppImages.profilephoto,
                      height: 100,

                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(width: 20),
                  Text(
                    'Tony Stark',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.05),
              Text(
                'Account',
                textAlign: TextAlign.start,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: Get.height * 0.015),
              GestureDetector(
                onTap: () => Get.toNamed(AppPages.editprofile),
                child: ProfileContainer(
                  tittle: "Personal Information",
                  image: AppImages.profileicon,
                ),
              ),
              SizedBox(height: Get.height * 0.015),
              ProfileContainer(
                tittle: "Subscription",
                image: AppImages.subscriptionicon,
              ),
              SizedBox(height: Get.height * 0.01),
              ProfileContainer(tittle: "History", image: AppImages.historyicon),
              SizedBox(height: Get.height * 0.05),
              Text(
                'Sequrity and Policy',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: Get.height * 0.015),
              ProfileContainer(
                tittle: "Notification",
                image: AppImages.notificationicon,
              ),
              SizedBox(height: Get.height * 0.015),
              ProfileContainer(
                tittle: "Privacy and Policy",
                image: AppImages.privacypolicyicon,
              ),
              SizedBox(height: Get.height * 0.015),
              GestureDetector(
                onTap: () => Get.toNamed(AppPages.forgotpassword),
                child: ProfileContainer(
                  tittle: "Reset Password",
                  image: AppImages.resetpasswordicon,
                ),
              ),
              SizedBox(height: Get.height * 0.015),
              GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),

                      height: Get.height * 0.35,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.logoutprofile,
                          height: 60,
                          width: 60,
                          ),
                          Text('Are you sure you want to log out of your account?',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xff6B7280)
                          ),
                          ),
                          GestureDetector(
                            onTap: () => Get.offAllNamed(AppPages.login),
                            child: Container(
                              height: Get.height*0.05,
                              width: Get.width*0.6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xffDC143C)
                              ),
                              child: Center(child: Text('Confirm Log Out',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white
                              ),
                              )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              height: Get.height*0.05,
                              width: Get.width*0.6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xffF3F4F6)
                              ),
                              child: Center(child: Text('Cancel',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xff727272)
                              ),
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                child: ProfileContainer(
                  tittle: "Log Out",
                  image: AppImages.logouticon,
                ),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
