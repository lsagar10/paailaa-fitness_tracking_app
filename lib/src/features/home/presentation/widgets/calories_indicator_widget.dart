import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paailaa/src/core/constants/colors.dart';

class CircularCaloriesIndicator extends StatelessWidget {
  final int percentage;
  final Color progressColor;
  final Color backgroundColor;

  const CircularCaloriesIndicator({
    Key? key,
    required this.percentage,
    this.progressColor = primaryColor,
    this.backgroundColor = const Color(0xFFC7E4FF),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      width: 176.w,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text and Icon on Top
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Calories',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 6.w),
              SvgPicture.asset(
                'assets/icons/homepage/calories.svg',
                height: 24.h,
                width: 24.w,
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Circular Indicator below
          SizedBox(
            width: 120.w,
            height: 120.h,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: percentage / 100,
                  strokeWidth: 15.w,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                ),
                Center(
                  child: Text(
                    '$percentage%',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: progressColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
