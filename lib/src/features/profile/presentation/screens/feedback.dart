import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paailaa/src/core/constants/colors.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_buttom.dart';
import 'package:paailaa/src/widgets/success_dialog.dart';

class Feedback extends StatelessWidget {
  const Feedback({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 56),
            Center(
              child: SvgPicture.asset('assets/icons/profile/feedback1.svg'),
            ),
            SizedBox(height: 46),
            Text(
              'We Value Your Opinion',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 20,
                height: 1.0,
                letterSpacing: -0.4,
                color: primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Your feedback helps us improve our services',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300, // 300 = Light
                fontStyle:
                    FontStyle.normal, // 'Light' refers to weight, not style
                fontSize: 14,
                height: 1.0, // 100% line-height
                letterSpacing: -0.28, // -2% of 14px
                color: Color(0xFF717171), // Hex color #717171
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 28),
            SizedBox(
              width: 291,
              height: 140,
              child: TextFormField(
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: '|',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
            ),

            const SizedBox(height: 47),
            CustomButton(
              text: 'Submit Feedback',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => SuccessDialog(
                    message: 'Successfully! Submitted your feedback',
                    onContinue: () => Navigator.pop(context),
                  ),
                );
              },
              height: 40,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
