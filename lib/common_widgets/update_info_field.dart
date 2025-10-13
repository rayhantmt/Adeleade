import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mementum/utils/app_colors.dart';
class UpdateInfoField extends StatelessWidget {
  final String tittle;
  final String hint;
  const UpdateInfoField({super.key, required this.tittle, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(tittle),
        Container(
          height: Get.height*0.05,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 1,
              color: AppColors.primarycolor
            ),
            borderRadius: BorderRadius.circular(12)
          ),
          child: Text(hint),
        ),
      ],
    );
  }
}