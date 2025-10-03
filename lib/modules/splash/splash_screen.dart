import 'package:flutter/material.dart';
import 'package:mementum/utils/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.amination,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
          ),
        ],
      )
    );
  }
}