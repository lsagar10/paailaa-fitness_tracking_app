import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paailaa/src/core/constants/colors.dart';
import 'package:paailaa/src/features/authentication/data/model/user_model.dart';
import 'package:paailaa/src/features/authentication/presentation/blocs/register/auth_bloc.dart';
import 'package:paailaa/src/features/authentication/presentation/screens/otp.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_buttom.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_textformfield.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/responsive_text_widget.dart';

class Signup2Screen extends StatelessWidget {
  final UserModel user;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Signup2Screen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Otp(),
              settings: RouteSettings(arguments: state.user.email),
            ),
          );
        } else if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
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

                /// Logo
                Center(
                  child: Image.asset(
                    'assets/images/logo_blue.png',
                    height: 100.h,
                    width: 245.w,
                  ),
                ),

                SizedBox(height: 40.h),

                /// Title
                Text(
                  'Create your account',
                  style: GoogleFonts.robotoFlex(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 20.h),
                _buildpasswordField(),
                SizedBox(height: 20.h),
                _buildconfirmPasswordField(),
                SizedBox(height: 20.h),

                /// Next Button
                CustomButton(
                  text: "Register",
                  onPressed: () {
                    if (_passwordController.text !=
                        _confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Passwords don't match")),
                      );
                      return;
                    }

                    final updatedUser = user.copyWith(
                      password: _passwordController.text,
                    );

                    context.read<AuthBloc>().add(
                      RegisterEvent(user: updatedUser),
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
      ),
    );
  }

  Widget _buildpasswordField() {
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
