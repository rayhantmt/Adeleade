// import 'package:flutter/material.dart';

// class PrivacyAndPolicyView extends StatelessWidget {
//   const PrivacyAndPolicyView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Text('content',
//         style: TextStyle(
//           fontSize: 30
//         ),
//         ),
//       ),
//     );
//   }
// }import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class PrivacyAndPolicyView extends StatelessWidget {
  const PrivacyAndPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Privacy Policy", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('1. Introduction & Identity of the Data Controller'),
            _buildBodyText(
                'This Privacy Policy explains how Momentum Activity ("App", "we", "us") collects, uses, stores, and shares information about you when you use our mobile application. We are committed to protecting your privacy in compliance with:'),
            _buildBulletPoint('The Swiss Federal Act on Data Protection (nDSG), in force since 1 September 2023'),
            _buildBulletPoint('The EU General Data Protection Regulation (GDPR) (Regulation 2016/679) — applicable to users located in the European Economic Area (EEA)'),
            _buildBulletPoint('The UK GDPR — applicable to users located in the United Kingdom'),
            _buildBulletPoint('Any other applicable national data protection legislation'),
            const SizedBox(height: 10),
            _buildBodyText('**Data Controller:**', isBold: true),
            _buildBulletPoint('Contact e-mail: momentumactivity@gmail.com'),
            
            const Divider(height: 40),

            _buildSectionTitle('2. What Data We Collect'),
            _buildSubsectionTitle('2.1 Data You Provide Directly'),
            _buildBulletPoint('Account registration data (e.g. username, e-mail address, password hash)'),
            _buildBulletPoint('Profile information you choose to add (e.g. display name, profile photo)'),
            _buildBulletPoint('User-generated content (UGC) posted, uploaded, or transmitted through the App'),
            _buildBulletPoint('Communications you send us (e.g. support requests, feedback)'),
            
            _buildSubsectionTitle('2.2 Data Collected Automatically'),
            _buildBulletPoint('Device identifiers (e.g. device model, operating system version)'),
            _buildBulletPoint('App usage data (e.g. screens visited, features used, session duration)'),
            _buildBulletPoint('Crash logs and diagnostic data'),
            _buildBulletPoint('IP address and approximate geographic location (country/city level)'),
            _buildBulletPoint('Timestamps of logins and actions'),

            const Divider(height: 40),

            _buildSectionTitle('3. Legal Basis for Processing'),
            _buildBulletPoint('**Performance of a contract** — to provide you with the App and its features (Art. 6(1)(b) GDPR).'),
            _buildBulletPoint('**Legitimate interests** — to improve the App, prevent fraud, and ensure security (Art. 6(1)(f) GDPR).'),
            _buildBulletPoint('**Consent** — where we ask for your permission (Art. 6(1)(a) GDPR). You may withdraw consent at any time via email.'),

            const Divider(height: 40),

            _buildSectionTitle('4. How We Use Your Data'),
            _buildBulletPoint('To create and manage your user account'),
            _buildBulletPoint('To provide, maintain, and improve the App\'s functionality'),
            _buildBulletPoint('To display user-generated content within the App'),
            _buildBulletPoint('To detect, prevent, and respond to fraud and security incidents'),
            _buildBulletPoint('To comply with legal obligations'),

            const Divider(height: 40),

            _buildSectionTitle('5. User-Generated Content (UGC)'),
            _buildBodyText('The App allows users to create and share content. Please note:'),
            _buildBulletPoint('Content may be visible to other users. Do not post sensitive personal info.'),
            _buildBulletPoint('We do not pre-screen UGC; email us to report violations.'),
            _buildBulletPoint('You are solely responsible for the content you post.'),

            const Divider(height: 40),

            _buildSectionTitle('6. Data Retention'),
            _buildBodyText('We retain personal data as long as your account is active. We delete or anonymise data upon your request (within 30 days) unless required by law.'),

            const Divider(height: 40),

            _buildSectionTitle('7. Your Rights'),
            _buildBodyText('Depending on your location, you have the right to access, rectify, erase, restrict, or object to the processing of your data.'),
            _buildBodyText('To exercise these rights, contact us at **momentumactivity@gmail.com**. We respond within 30 days.'),

            const Divider(height: 40),

            _buildSectionTitle('8. Children\'s Privacy'),
            _buildBodyText('The App is not intended for individuals under 18. Minors may only participate if supervised by a parent or legal guardian.'),

            const Divider(height: 40),

            _buildSectionTitle('9. Contact'),
            _buildBodyText('E-mail: momentumactivity@gmail.com'),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Helper method for Section Headers
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
      ),
    );
  }

  // Helper method for Subsections
  Widget _buildSubsectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Helper method for standard body text
  Widget _buildBodyText(String text, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          height: 1.5,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: Colors.black87,
        ),
      ),
    );
  }

  // Helper method for bullet points
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}