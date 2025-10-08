import 'package:flutter/material.dart';

import 'package:mementum/utils/app_images.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECE4D1),
      body: SafeArea(
        
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  AppImages.logo,
                  height: 40,
                  width: 40,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
