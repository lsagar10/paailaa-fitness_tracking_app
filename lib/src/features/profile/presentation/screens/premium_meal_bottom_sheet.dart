import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paailaa/src/core/constants/colors.dart';

class PremiumMealsBottomSheet extends StatelessWidget {
  const PremiumMealsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Title
                Text(
                  "Upgrade To Premium Benefits",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'RobotoFlex',
                    fontWeight: FontWeight.w500, // 500 = Medium
                    fontStyle: FontStyle.normal,
                    fontSize: 20.sp,
                    height: 1.25, // 125% line-height
                    letterSpacing: -0.4, // -2% of 20px
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 20.h),

                /// Description
                Text(
                  "Upgrade to our premium subscription for unlimited access to exclusive features.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                SizedBox(height: 30.h),

                /// Benefits
                _buildBenefit(
                  "Customized plans : Customized Meal and Workout plans.",
                ),
                SizedBox(height: 15),
                _buildBenefit(
                  "Add Premium Food : Add your own food nutritional info.",
                ),
                SizedBox(height: 15),

                _buildBenefit(
                  "Analytics Step Counter Graph : Track steps & trends.",
                ),
                SizedBox(height: 15),
                _buildBenefit(
                  "Recommendation: Get personalized fitness & nutrition advice.",
                ),
                SizedBox(height: 50.h),

                Container(
                  width: 316.w,
                  height: 57.h, // keep height but reduce vertical padding
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h, // reduced from 16.h to 8.h
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // center vertically
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: primaryColor, // blue color
                        size: 26.sp, // slightly smaller icon to fit better
                      ),
                      SizedBox(width: 12.w),

                      /// Column with Buy Premium and Rs. 500 / month texts
                      Column(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // center vertically in container
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Buy Premium",
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            "Rs. 500 / month",
                            style: GoogleFonts.poppins(fontSize: 12.sp),
                          ),
                        ],
                      ),

                      Spacer(),

                      /// Purchase Button
                      SizedBox(
                        height: 35
                            .h, // slightly taller button for better touch area
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(91.w, 35.h),
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          onPressed: () {
                            // Handle purchase logic
                          },
                          child: Text(
                            "Purchase",
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBenefit(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Colors.white, size: 30),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
