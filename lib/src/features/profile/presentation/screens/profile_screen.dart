import 'package:flutter/material.dart' hide Feedback;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paailaa/src/core/constants/colors.dart';
import 'package:paailaa/src/features/profile/presentation/screens/about.dart';
import 'package:paailaa/src/features/profile/presentation/screens/change_password.dart';
import 'package:paailaa/src/features/profile/presentation/screens/faq.dart';
import 'package:paailaa/src/features/profile/presentation/screens/feedback.dart';
import 'package:paailaa/src/features/profile/presentation/screens/my_information.dart';
import 'package:paailaa/src/features/profile/presentation/screens/premium_meal_bottom_sheet.dart';
import 'package:paailaa/src/features/profile/presentation/screens/privacy_policy.dart';
import 'package:paailaa/src/features/profile/presentation/screens/terms_conditions.dart';
import 'package:paailaa/src/features/profile/presentation/widgets/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundColor: primaryColor,
                      child: Text(
                        "SB",
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome, Sagar!",
                          style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "example@gmail.com",
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF717171),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24.h),

                /// Personal Info
                SectionTitle(title: "Personal Information"),
                ProfileListTile(
                  iconPath: "assets/icons/profile/my_info.svg",
                  title: "My Information",
                  destination: const MyInformation(),
                ),
                ProfileListTile(
                  iconPath: "assets/icons/profile/premium_meal.svg",
                  title: "Premium Meals",
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const PremiumMealsBottomSheet(),
                    );
                  },
                ),

                /// About Us
                const SectionTitle(title: "About Us"),
                ProfileListTile(
                  iconPath: "assets/icons/profile/about.svg",
                  title: "About Paailaa",
                  destination: const About(),
                ),
                ProfileListTile(
                  iconPath: "assets/icons/profile/tandc.svg",
                  title: "Terms & Conditions",
                  destination: const TermsConditions(),
                ),
                ProfileListTile(
                  iconPath: "assets/icons/profile/privacy.svg",
                  title: "Privacy Policy",
                  destination: const PrivacyPolicy(),
                ),
                ProfileListTile(
                  iconPath: "assets/icons/profile/faq.svg",
                  title: "FAQs",
                  destination: const FaqScreen(),
                ),

                /// General
                const SectionTitle(title: "General"),
                ProfileListTile(
                  iconPath: "assets/icons/profile/share.svg",
                  title: "Share App",
                  destination: const ProfileScreen(),
                ),
                ProfileListTile(
                  iconPath: "assets/icons/profile/feedback.svg",
                  title: "Feedback",
                  destination: const Feedback(),
                ),
                ProfileListTile(
                  iconPath: "assets/icons/profile/change_pw.svg",
                  title: "Change Password",
                  destination: ChangePasswordProfile(),
                ),
                ProfileListTile(
                  iconPath: "assets/icons/profile/logout.svg",
                  title: "Log out",
                  destination: const ProfileScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
