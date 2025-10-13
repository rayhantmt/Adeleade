import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/utils/app_colors.dart';

class UpdateInfoField extends StatelessWidget {
  final String tittle;
  final String hint;
  const UpdateInfoField({super.key, required this.tittle, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tittle,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.black
        ),
        ),
        Container(
          height: Get.height * 0.05,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: AppColors.primarycolor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: TextFormField(
            
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none),
            ),
          ),
        ),
      ],
    );
  }
}
