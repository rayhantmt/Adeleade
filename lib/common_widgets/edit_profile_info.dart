import 'package:flutter/material.dart';

class EditProfileInfo extends StatelessWidget {
  final String tittle;
  final String info;
  const EditProfileInfo({super.key, required this.tittle, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(tittle)
      ],
    );
  }
}