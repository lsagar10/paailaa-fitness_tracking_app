import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  const About({super.key});

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
              'About Paailaa',
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
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fitness begins with a step – and Paailaa is here to guide every one of them.',
                    style: GoogleFonts.robotoFlex(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      height: 1.25,
                      letterSpacing: -0.36,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'At Paailaa, we believe that staying fit is a journey, not a destination. Our mission is to make that journey easier, more motivating, and deeply personal. Paailaa is a comprehensive fitness tracking application designed to empower users to take control of their health and well-being.',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      height: 1.25,
                      letterSpacing: -0.28,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    "Whether you're just starting or you're a seasoned health enthusiast, Paailaa helps you stay on track through:",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      height: 1.25,
                      letterSpacing: -0.28,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "🚶‍♀️ Step Tracker: Monitor your daily movement and stay active.",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      height: 1.25,
                      letterSpacing: -0.28,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "🍱 Food Logging: Track your meals and nutrition with ease.",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      height: 1.25,
                      letterSpacing: -0.28,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "💊 Pill Reminders: Never miss your supplements or medications again",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      height: 1.25,
                      letterSpacing: -0.28,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "🔔 Motivational Nudges: Encouragement to keep going when you need it most.",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      height: 1.25,
                      letterSpacing: -0.28,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "📊 Progress Insights: Personalized data to help you understand and improve your lifestyle",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      height: 1.25,
                      letterSpacing: -0.28,
                    ),
                  ),
                  const SizedBox(height: 23),
                  Text(
                    "With Paailaa, every small step adds up to big change. We’re not just a tracker – we’re your daily companion in the pursuit of a healthier you.",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      height: 1.25,
                      letterSpacing: -0.28,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Fixed footer (unscrollable)
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
}
