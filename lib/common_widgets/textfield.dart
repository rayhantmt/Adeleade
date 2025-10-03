import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Commontextfield extends StatelessWidget {
  const Commontextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*0.1,
      width: Get.width*0.8,
      decoration: BoxDecoration(
color: Colors.red
      ),
      child: Text('data'),
    );

  }
}