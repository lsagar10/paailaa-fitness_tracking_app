import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paailaa/src/core/constants/colors.dart';
import 'package:paailaa/src/features/authentication/data/model/otp_model.dart';
import 'package:paailaa/src/features/authentication/presentation/blocs/register/auth_bloc.dart';
import 'package:paailaa/src/features/authentication/presentation/screens/change_password.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_buttom.dart';

class Otp extends StatefulWidget {
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  late String email;
  bool _isResending = false;

  @override
  void initState() {
    super.initState();
    email = ModalRoute.of(context)!.settings.arguments as String;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is OtpVerified) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ChangePassword()),
          );
        } else if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),

              /// Back SVG
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

              SizedBox(height: 24.h),

              /// Title
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Verify ',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Email Address',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 32.h),

              /// OTP fields
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(4, _buildOtpBox),
              ),

              SizedBox(height: 25.h),

              /// Resend message and feedback
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Didn't get the code? "),
                      GestureDetector(
                        onTap: _isResending
                            ? null
                            : () {
                                setState(() => _isResending = true);
                                context.read<AuthBloc>().add(
                                  ResendOtpEvent(email: email),
                                );
                                Future.delayed(Duration(seconds: 30), () {
                                  if (mounted) {
                                    setState(() => _isResending = false);
                                  }
                                });
                              },
                        child: Text(
                          'Resend code ',
                          style: TextStyle(
                            color: _isResending ? Colors.grey : primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        '1:00',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is OtpResent) {
                        return Text(
                          'New OTP has been sent to your email',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 12.sp,
                          ),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ],
              ),

              SizedBox(height: 32.h),

              /// Verify Button
              CustomButton(
                text: "Verify OTP",
                onPressed: () {
                  final otp = _controllers.map((c) => c.text).join();
                  if (otp.length == 4) {
                    context.read<AuthBloc>().add(
                      VerifyOtpEvent(
                        otp: OtpModel(email: email, otp: otp),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter complete OTP')),
                    );
                  }
                },
                color: primaryColor,
                textColor: Colors.white,
                width: 400,
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtpBox(int index) {
    return Container(
      width: 50.w,
      height: 50.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(6.r),
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18.sp),
        decoration: InputDecoration(counterText: '', border: InputBorder.none),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            _focusNodes[index + 1].requestFocus();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
