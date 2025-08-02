import 'package:flutter/material.dart';
import 'package:paailaa/src/core/constants/colors.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF2D70C7)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 18,
                  color: Color(0xFF2D70C7),
                ),
              ),
            ),
            const SizedBox(width: 40),
            const Text(
              'Terms and Conditions',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF2D70C7),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align everything to the left
                  children: [
                    Text(
                      'Your privacy is important to us. This Privacy Policy explains how Paailaa collects, uses, and protects your information.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        height: 1.25,
                        letterSpacing: -0.28,
                        color: const Color(0xFF4D5053),
                      ),
                    ),
                    const SizedBox(height: 20),

                    _buildSectionTitle('1. Information we collect'),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildBulletPoint(
                            "Personal data (name, age, gender, etc.)",
                          ),
                          const SizedBox(height: 4),
                          _buildBulletPoint(
                            "Health-related data (steps, meals, medication, etc.)",
                          ),
                          const SizedBox(height: 4),
                          _buildBulletPoint(
                            "Device data (OS, app version, etc.)",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildSectionTitle('2. How we use your data'),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildBulletPoint(
                            'To personalize your fitness journey',
                          ),
                          const SizedBox(height: 4),
                          _buildBulletPoint(
                            'To send reminders, insights, and motivation',
                          ),
                          const SizedBox(height: 4),
                          _buildBulletPoint(
                            'To improve and enhance app performance.',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildSectionTitle('3. Data Security'),
                    const SizedBox(height: 8),
                    _buildSectionText(
                      'We use industry-standard encryption and secure protocols to protect your information.',
                    ),
                    const SizedBox(height: 24),
                    _buildSectionTitle('4. Third-Party Services'),
                    const SizedBox(height: 8),
                    _buildSectionText(
                      'We may use third-party tools (like analytics) but will never sell or share your data without consent.',
                    ),
                    const SizedBox(height: 24),
                    _buildSectionTitle('5. Your Rights'),
                    const SizedBox(height: 8),
                    _buildSectionText(
                      'You may request to view, edit, or delete your data at any time. Contact us at support@paailaa.com for assistance.',
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),

          // Footer outside scroll
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            width: double.infinity,

            child: Center(
              child: Text(
                '© 2025 Paalias. All rights reserved. | Developed by Debuggers.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontFamily: 'Roboto',
                  height: 1.25,
                  letterSpacing: -0.02,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
        color: primaryColor,
        height: 1.25,
        letterSpacing: -0.02,
      ),
    );
  }

  Widget _buildSectionText(String text) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        color: Colors.black,
        height: 1.25,
        letterSpacing: -0.02,
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '• ',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto',
            color: Colors.black,
          ),
        ),
        Expanded(child: _buildSectionText(text)),
      ],
    );
  }
}
