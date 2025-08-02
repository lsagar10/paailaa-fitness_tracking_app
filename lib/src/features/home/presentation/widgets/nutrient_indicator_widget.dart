import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NutrientCircularIndicators extends StatelessWidget {
  final int proteinPercentage;
  final int fatsPercentage;
  final int sodiumPercentage;
  final Color containerColor;
  final Color progressColor;

  const NutrientCircularIndicators({
    Key? key,
    this.proteinPercentage = 83,
    this.fatsPercentage = 83,
    this.sodiumPercentage = 83,
    this.containerColor = Colors.black,
    this.progressColor = Colors.green, // Change to your preferred color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      width: 176.w,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCircularIndicator('Protein', proteinPercentage),
          SizedBox(height: 10),
          _buildCircularIndicator('Fats', fatsPercentage),
          SizedBox(height: 10),
          _buildCircularIndicator('Sodium', sodiumPercentage),
        ],
      ),
    );
  }

  Widget _buildCircularIndicator(String label, int percentage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Circular Indicator on the left
        SizedBox(
          width: 40.w,
          height: 40.h,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: percentage / 100,
                strokeWidth: 7.w,
                backgroundColor: Colors.grey[800],
                valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              ),
              Center(
                child: Text(
                  '$percentage%',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Space between indicator and label
        SizedBox(width: 10.w),

        // Text label on the right
        Expanded(
          child: Text(
            label,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
