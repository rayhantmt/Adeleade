import 'package:flutter/material.dart';

class UnlockMomentumView extends StatelessWidget {
  const UnlockMomentumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECE4D1)  
      
,
body: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Text('Every great journey begins with the right people',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 28,
    ),
    )
  ],
),
    );
  }
}