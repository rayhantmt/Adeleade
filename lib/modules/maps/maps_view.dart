import 'package:flutter/material.dart';
import 'package:mementum/utils/app_images.dart';

class MapsView extends StatelessWidget {
  const MapsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.background,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text('Events Happening Near you',textAlign: TextAlign.center,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}