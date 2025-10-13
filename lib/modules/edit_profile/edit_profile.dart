import 'package:flutter/material.dart';
import 'package:mementum/utils/app_images.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.background)
        ],
      ),
    );
  }
}