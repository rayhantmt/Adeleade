import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Icon(Icons.location_on_outlined),
            Icon(Icons.add_circle_outline_outlined),
            Icon(Icons.chat),
            Icon(Icons.home_filled)
          ],
        ),
      ),
    );
  }
}