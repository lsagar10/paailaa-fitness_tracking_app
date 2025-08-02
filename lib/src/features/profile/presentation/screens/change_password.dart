import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paailaa/src/core/constants/colors.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_buttom.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_textformfield.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/responsive_text_widget.dart';
import 'package:paailaa/src/widgets/success_dialog.dart';

class ChangePasswordProfile extends StatelessWidget {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  ChangePasswordProfile({super.key});

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
              'Feedback',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF2D70C7),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildoldpasswordField(),
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

  Widget _buildoldpasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveText(
          text: 'Old Password',
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
          hintText: 'Enter your old Password',
          textInputAction: TextInputAction.next,
          validator: null,
          isPassword: true,
          cursorColor: textFormFieldBorderColor,
        ),
      ],
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
