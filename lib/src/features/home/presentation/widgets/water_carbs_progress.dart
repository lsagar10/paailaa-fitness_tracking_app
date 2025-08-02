import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaterCarbsProgressCard extends StatelessWidget {
  final String label;
  final int goalAmount;
  final int consumedAmount;
  final Color backgroundColor;
  final Color progressColor;
  final VoidCallback? onTap; // ← NEW

  const WaterCarbsProgressCard({
    Key? key,
    required this.label,
    required this.goalAmount,
    required this.consumedAmount,
    this.backgroundColor = const Color(0xFF4075B7),
    this.progressColor = Colors.black,
    this.onTap, // ← NEW
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progress = goalAmount == 0 ? 0 : consumedAmount / goalAmount;

    return GestureDetector( // ← WRAP with GestureDetector
      onTap: onTap, // ← SET onTap
      child: Container(
        height: 76.h,
        width: 176.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 6.w),
                Icon(Icons.water_drop, color: Colors.white, size: 18.sp),
              ],
            ),
            Text(
              '$consumedAmount ml',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 120.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: LinearProgressIndicator(
                    value: progress.clamp(0.0, 1.0),
                    backgroundColor: Colors.black,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    minHeight: 10.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
