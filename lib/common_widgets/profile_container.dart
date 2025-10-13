import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
    required this.tittle,
    required this.image,
  });
  final String tittle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.05,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Color(0xffC4B794)),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(image,
            // height: 24,
            // width: 24,
            ),
          ),
          Text(tittle,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black
          ),
          )
        ],
      ),
    );
  }
}
