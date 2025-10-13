import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileInfo extends StatelessWidget {
  final String tittle;
  final String info;
  const EditProfileInfo({super.key, required this.tittle, required this.info});

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
        SizedBox(height: Get.height*0.005,),
        Container(
          height: Get.height*0.04,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: Color(0xff625B4A)
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(info,
            style: GoogleFonts.inter(

              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.black
            ),
            ),
          ),
        )
      ],
    );
  }
}