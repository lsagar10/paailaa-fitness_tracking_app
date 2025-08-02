import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paailaa/src/core/constants/colors.dart';
import 'package:paailaa/src/features/authentication/data/model/user_model.dart';
import 'package:paailaa/src/features/authentication/presentation/blocs/register/auth_bloc.dart';
import 'package:paailaa/src/features/authentication/presentation/screens/forget_password.dart';
import 'package:paailaa/src/features/authentication/presentation/screens/signup_screen.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_buttom.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_textformfield.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/responsive_text_widget.dart';
import 'package:paailaa/src/features/home/presentation/screens/homescreen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          // Navigate to home screen on successful login
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
          // You might want to store the user token here
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }

      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.h),
                Center(
                  child: Image.asset(
                    'assets/images/logo_blue.png',
                    height: 111.h,
                    width: 272.w,
                  ),
                ),
                SizedBox(height: 60.h),

                // Title
                Text(
                  'Login to your account',
                  style: GoogleFonts.robotoFlex(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 30.h),

                _buildEmailField(),

                SizedBox(height: 20.h),

                _buildPasswordField(),
                // Forget Password aligned right
                SizedBox(height: 20.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Forget Password?',
                        style: GoogleFonts.robotoFlex(
                          fontSize: 14.sp,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30.h),

                // Login Button
                CustomButton(
                  text: "Login",
                  onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        final user = UserModel(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        context.read<AuthBloc>().add(LoginEvent(user: user));
                      }
                  },
                  // color: primaryColor,
                  color: primaryColor,
                  textColor: Colors.white,
                  width: 400,
                  height: 50,
                ),

                SizedBox(height: 20.h),

                // OR text centered
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ' or ',
                      style: GoogleFonts.robotoFlex(fontSize: 16.sp),
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                // Continue with Google button - Modified version
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 361.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).scaffoldBackgroundColor, // Matches scaffold
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/google.png',
                              width: 24.w,
                              height: 24.h,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.g_mobiledata, size: 24.w),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              'Continue with Google',
                              style: TextStyle(
                                color: const Color(0xFF867A7A),
                                fontSize: 14.sp,
                                fontFamily: 'Roboto Flex',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'New to Paailaa? ',
                            style: GoogleFonts.robotoFlex(
                              fontSize: 14.sp,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'Create account',
                            style: GoogleFonts.robotoFlex(
                              fontSize: 14.sp,
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
          hintText: 'Enter your password',
          textInputAction: TextInputAction.next,
          validator: null,
          cursorColor: textFormFieldBorderColor,
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
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
          hintText: 'Enter your password',
          textInputAction: TextInputAction.go,
          keyboardType: TextInputType.text,
          isPassword: true,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (value.length < 8) {
              return 'Your password must have at least 8 characters.';
            }
            return null;
          },
          cursorColor: primaryColor,
        ),
      ],
    );
  }
}
