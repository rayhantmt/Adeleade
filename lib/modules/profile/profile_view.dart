import 'package:flutter/material.dart';
import 'package:mementum/utils/app_images.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F7F1),
      body: SafeArea(child: Column(
children: [
  Row(children: [
    Image.asset(AppImages.back_icon)
  ],)
],
      )),
    );
  }
}
