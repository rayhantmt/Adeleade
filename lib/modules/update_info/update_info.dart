import 'package:flutter/material.dart';
import 'package:mementum/utils/app_images.dart';

class UpdateInfoView extends StatelessWidget {
  const UpdateInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Stack(
        children: [
          Image.asset(AppImages.background),
          Column(
            children: [
              
            ],
          )
        ],
      )),
    );
  }
}