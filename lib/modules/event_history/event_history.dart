import 'package:flutter/material.dart';
import 'package:mementum/utils/app_images.dart';

class EventHistory extends StatelessWidget {
  const EventHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.background,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}