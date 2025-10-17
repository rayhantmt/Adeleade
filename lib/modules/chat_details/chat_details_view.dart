import 'package:flutter/material.dart';
import 'package:mementum/utils/app_images.dart';

class ChatDetailsView extends StatelessWidget {
  const ChatDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.background,
          height: double.infinity,
          width: double.infinity,

fit: BoxFit.cover,          )
        ],
      ),
    );
  }
}