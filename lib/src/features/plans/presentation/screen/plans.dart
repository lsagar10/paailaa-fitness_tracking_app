import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paailaa/src/core/constants/colors.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_buttom.dart';
import 'package:paailaa/src/features/plans/presentation/screen/subscription_plans.dart';

class Plans extends StatelessWidget {
  const Plans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,

        title: const Text(
          'Fitness Plan',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF2D70C7),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Unlock Your Personalized Fitness Plan',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600, // SemiBold
                fontStyle: FontStyle.normal,
                fontSize: 20,
                height: 1.0, // line-height: 100%
                letterSpacing: -0.02 * 20, // -2% of font size
                color: primaryColor,
              ),
            ),

            const SizedBox(height: 40),
            Text(
              "You haven't subscribed to our premium plan yet.",
              style: GoogleFonts.roboto(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              "Upgrade now to get access to:",
              style: GoogleFonts.roboto(fontSize: 16),
            ),
            const SizedBox(height: 10),
            ...[
              'Daily customized meal plans',
              'Daily customized workout plans',
              'Nutrition tailored to your body goals',
              'Expert-curated health insights',
              'Visualize your progress with detailed step count graphs, showing daily, weekly, and monthly trends to help you stay on track.',
            ].map(
              (text) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('✅  ', style: GoogleFonts.roboto(fontSize: 16)),
                    Expanded(
                      child: Text(
                        text,
                        style: GoogleFonts.roboto(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Take the next step towards a healthier, stronger you.",
              style: GoogleFonts.roboto(fontSize: 16),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Add purchase logic here
              },
              child: Text(
                'Become a Premium Member by Clicking the purchase button below.',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500, // Medium
                  fontStyle: FontStyle.normal,
                  height: 1.0, // 100% line height
                  letterSpacing: -0.32, // -2% of 16px
                  color: primaryColor,
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Center(
              child: CustomButton(
                height: 40,
                width: 200,
                text: 'Purchase',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubscriptionPlans(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
