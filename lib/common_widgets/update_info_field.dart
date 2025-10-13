import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateInfoField extends StatelessWidget {
  final String tittle;
  final String hint;
  const UpdateInfoField({super.key, required this.tittle, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*0.07,
      decoration: BoxDecoration(
        color: Colors.red
      ),
      child: Text(tittle),
    );
  }
}