import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paailaa/src/core/constants/colors.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color textColor;
  final double fontSize;
  final double height;
  final double width;
  final double borderRadius;
  final FontWeight fontWeight;
  final List<Color>? gradientColors;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor = Colors.white,
    this.fontSize = 14,
    this.height = 40,
    this.width = double.infinity,
    this.borderRadius = 7,
    this.fontWeight = FontWeight.w500,
    this.gradientColors, // Add this for gradient support
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        child: Material(
          color: Colors.transparent, // lets gradient show
          child: InkWell(
            borderRadius: BorderRadius.circular(borderRadius.r),
            onTap: onPressed,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize.sp,
                  fontWeight: fontWeight,
                  fontFamily: 'roboto',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
