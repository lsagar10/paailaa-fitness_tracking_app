import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paailaa/src/core/constants/colors.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_buttom.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_textformfield.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/responsive_text_widget.dart';
import 'package:paailaa/src/widgets/success_dialog.dart';

class HealthData extends StatelessWidget {
  final TextEditingController _bloodPressureController =
      TextEditingController();
  final TextEditingController _sugarLabelController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  HealthData({super.key});

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
              'Health Data',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF2D70C7),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildbloodPressureField(),
            SizedBox(height: 20),
            _buildbloodPressureField(),
            SizedBox(height: 20),
            _buildweightField(),
            SizedBox(height: 20),
            CustomButton(
              text: 'Update',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => SuccessDialog(
                    message: 'Successfully! updated your Health Data',
                    onContinue: () => Navigator.pop(context),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildbloodPressureField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveText(
          text: 'Blood Pressure',
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
          controller: _bloodPressureController,
          keyboardType: TextInputType.emailAddress,
          hintText: ' 120/80 mmHg',
          textInputAction: TextInputAction.next,
          validator: null,
          cursorColor: textFormFieldBorderColor,
        ),
      ],
    );
  }

  Widget _buildsugarLabelField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveText(
          text: 'Suger Label',
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
          controller: _sugarLabelController,
          keyboardType: TextInputType.emailAddress,
          hintText: ' 80 mm/Ld',
          textInputAction: TextInputAction.next,
          validator: null,
          cursorColor: textFormFieldBorderColor,
        ),
      ],
    );
  }

  Widget _buildweightField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveText(
          text: 'Weight',
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
          controller: _weightController,
          keyboardType: TextInputType.emailAddress,
          hintText: ' 80 kgs',
          textInputAction: TextInputAction.next,
          validator: null,
          cursorColor: textFormFieldBorderColor,
        ),
      ],
    );
  }
}
