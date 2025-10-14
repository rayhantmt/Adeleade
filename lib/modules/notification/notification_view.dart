import 'package:flutter/material.dart';
import 'package:mementum/utils/app_images.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.background,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}