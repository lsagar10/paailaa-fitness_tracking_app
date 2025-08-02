import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paailaa/src/core/constants/colors.dart';
import 'package:paailaa/src/features/authentication/data/model/user_model.dart';
import 'package:paailaa/src/features/authentication/presentation/blocs/register/auth_bloc.dart';
import 'package:paailaa/src/features/authentication/presentation/screens/login_screen.dart';
import 'package:paailaa/src/features/authentication/presentation/screens/signup2_screen.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_buttom.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_textformfield.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/responsive_text_widget.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Signup2Screen(user: state.user),
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
                _buildfullNameField(),
                SizedBox(height: 20.h),
                _buildEmailField(),
                SizedBox(height: 20.h),
                _buildageField(),
                SizedBox(height: 20.h),
                _buildgenderField(),
                SizedBox(height: 20.h),

                /// Next Button
                CustomButton(
                  text: "Next",
                  onPressed: () {
                    final user = UserModel(
                      fullName: _fullNameController.text,
                      password: '',
                      email: _emailController.text,
                      age: _ageController.text,
                      gender: _genderController.text,
                    );
                    context.read<AuthBloc>().add(RegisterEvent(user: user));
                  },
                  color: primaryColor,
                  textColor: Colors.white,
                  width: 400,
                  height: 50,
                ),

                SizedBox(height: 20.h),

                /// OR
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

                /// Continue with Google
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 361.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
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

                /// Already have an account?
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Already have an Account? ',
                            style: GoogleFonts.robotoFlex(
                              fontSize: 14.sp,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'Sign in',
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
          hintText: 'Enter your Email',
          textInputAction: TextInputAction.next,
          validator: null,
          cursorColor: textFormFieldBorderColor,
        ),
      ],
    );
  }

  Widget _buildfullNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveText(
          text: 'Full Name',
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
          controller: _fullNameController,
          hintText: 'Enter your Full name',
          textInputAction: TextInputAction.go,
          keyboardType: TextInputType.text,
          validator: null,
          cursorColor: primaryColor,
        ),
      ],
    );
  }

  Widget _buildageField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveText(
          text: 'Age',
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
          controller: _ageController,
          hintText: 'Enter your age',
          textInputAction: TextInputAction.go,
          keyboardType: TextInputType.text,
          validator: null,
          cursorColor: primaryColor,
        ),
      ],
    );
  }

  Widget _buildgenderField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveText(
          text: 'Gender',
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
          controller: _genderController,
          hintText: 'Enter your Gender',
          textInputAction: TextInputAction.go,
          keyboardType: TextInputType.text,
          validator: null,
          cursorColor: primaryColor,
        ),
      ],
    );
  }
}
