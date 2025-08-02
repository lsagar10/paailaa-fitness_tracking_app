import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paailaa/src/core/constants/colors.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_buttom.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_textformfield.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/responsive_text_widget.dart';
import 'package:paailaa/src/widgets/success_dialog.dart';

class ChangePassword extends StatelessWidget {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),

              /// Back Button
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'assets/icons/back.svg',
                    width: 39.w,
                    height: 39.h,
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: 40.h),

              /// Title
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Change ',
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

              SizedBox(height: 20.h),
              _buildpasswordField(),
              SizedBox(height: 20.h),
              _buildconfirmPasswordField(),
              SizedBox(height: 20.h),

              /// Next Button
              CustomButton(
                text: "Change Password",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => SuccessDialog(
                      message: 'Successfully! Changed your Password',
                      onContinue: () => Navigator.pop(context),
                    ),
                  );
                },
                color: primaryColor,
                textColor: Colors.white,
                width: 400,
                height: 50,
              ),

              SizedBox(height: 20.h),

              /// OR
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildpasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveText(
          text: 'Password',
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
          controller: _passwordController,
          keyboardType: TextInputType.emailAddress,
          hintText: 'Enter your new Password',
          textInputAction: TextInputAction.next,
          validator: null,
          isPassword: true,
          cursorColor: textFormFieldBorderColor,
        ),
      ],
    );
  }

  Widget _buildconfirmPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveText(
          text: 'Confirm Password',
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
          controller: _confirmPasswordController,
          keyboardType: TextInputType.emailAddress,
          hintText: 'Confirm your new Password',
          textInputAction: TextInputAction.next,
          validator: null,
          isPassword: true,
          cursorColor: textFormFieldBorderColor,
        ),
      ],
    );
  }
}
