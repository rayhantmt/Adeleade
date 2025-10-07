import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mementum/utils/app_colors.dart';

class UnlockMomentumView extends StatelessWidget {
  const UnlockMomentumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECE4D1),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Get.height * 0.2),
            Text(
              'Every great journey begins with the right people.',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            SizedBox(height: Get.height * 0.05),
            Text(
              'Invite 3 frinends you would want by your side and unlock your mementum',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            Icon(Icons.share),
            SizedBox(height: Get.height * 0.3),
            Container(
              height: Get.height * 0.07,
              width: Get.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99),
                color: AppColors.primarycolor,
              ),
              child: Center(
                child: Text(
                  'Unlock Momentum',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
