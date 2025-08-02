import 'package:flutter/material.dart';
import 'package:paailaa/src/core/constants/colors.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

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
                      'These Terms and Conditions ("Terms") govern your use of the Paalias mobile application and its services.',
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

                    _buildSectionTitle('1. Acceptance of Terms'),
                    const SizedBox(height: 8),
                    _buildSectionText(
                      'By accessing or using Paalias, you agree to be bound by these Terms. If you disagree with any part, please do not use the app.',
                    ),
                    const SizedBox(height: 24),
                    _buildSectionTitle('2. Use of Service'),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildBulletPoint(
                            'You must be 13 years or older to use Paalias.',
                          ),
                          const SizedBox(height: 4),
                          _buildBulletPoint(
                            'The app is for personal, non-commercial use only.',
                          ),
                          const SizedBox(height: 4),
                          _buildBulletPoint(
                            'You agree not to misuse or attempt to exploit the application in any way.',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildSectionTitle('3. Health Disclaimer'),
                    const SizedBox(height: 8),
                    _buildSectionText(
                      'Paalias provides health and fitness tracking tools, but it is not a substitute for medical advice. Consult your doctor before beginning any health program.',
                    ),
                    const SizedBox(height: 24),
                    _buildSectionTitle('4. Account & Data'),
                    const SizedBox(height: 8),
                    _buildSectionText(
                      'You are responsible for maintaining the confidentiality of your account. You agree to provide accurate information while using our services.',
                    ),
                    const SizedBox(height: 24),
                    _buildSectionTitle('5. Modifications'),
                    const SizedBox(height: 8),
                    _buildSectionText(
                      'We may update these Terms from time to time. Continued use after changes implies acceptance.',
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
