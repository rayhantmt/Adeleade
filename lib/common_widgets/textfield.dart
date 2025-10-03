import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Commontextfield extends StatelessWidget {
  const Commontextfield({super.key, required this.tittle, this.icon});
  final String tittle;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.05,
      width: Get.width * 0.7,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Color(0xffEDF1F3)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10),
          hintText: tittle,
          suffixIcon: icon,
          border: InputBorder.none,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color(0xff1A1C1E)
          )
        ),
      ),
    );
  }
}
