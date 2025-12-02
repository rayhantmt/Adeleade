import 'package:flutter/material.dart';

class PrivacyAndPolicyView extends StatelessWidget {
  const PrivacyAndPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Privacy and policy ',
        style: TextStyle(
          fontSize: 30
        ),
        ),
      ),
    );
  }
}