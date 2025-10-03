import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mementum/modules/splash/splash_screen.dart';
import 'package:mementum/routes/app_pages.dart';
import 'package:mementum/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      getPages: AppRoutes.pages,
    );
  }
}