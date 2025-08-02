import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart'; // corrected import
import 'package:paailaa/src/core/constants/colors.dart';
import 'package:paailaa/src/features/authentication/presentation/screens/otp.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_buttom.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_textformfield.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/responsive_text_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),

            /// Back SVG icon
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  'assets/icons/back.svg',
                  width: 39.w,
                  height: 39.h,
                  color: Colors.black,
                ),
              ),
            ),

            SizedBox(height: 28.h),

            /// Title
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Forgot ',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'password',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25.h),

            _buildEmailField(),

            SizedBox(height: 25.h),

            CustomButton(
              text: "Send OTP",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Otp()),
                );
              },
              color: primaryColor,
              textColor: Colors.white,
              width: 400,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveText(
          text: 'Email',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontFamily: 'Roboto Flex',
            fontWeight: FontWeight.w500,
            height: 1.25,
            letterSpacing: -0.32,
          ),
        ),
        const SizedBox(height: 6),
        CustomTextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          hintText: 'Enter your Email',
          textInputAction: TextInputAction.next,
          validator: null,
          cursorColor: textFormFieldBorderColor,
        ),
      ],
    );
  }
}
