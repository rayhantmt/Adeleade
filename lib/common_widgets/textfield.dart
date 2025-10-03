import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Commontextfield extends StatelessWidget {
  const Commontextfield({super.key, required this.tittle});
final String tittle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.05,
      width: Get.width * 0.7,
      decoration: BoxDecoration(
border: Border.all(
  width: 1,
  color: Color(0xffEDF1F3),
  
),
borderRadius: BorderRadius.circular(10)

      ),
      child: TextFormField(
        
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10),
         hintText: tittle,
border: InputBorder.none
        ),
      ),
    );
  }
}
