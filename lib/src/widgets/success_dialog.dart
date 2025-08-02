import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessDialog extends StatelessWidget {
  final String message;
  final VoidCallback onContinue;
  final String continueButtonText;

  const SuccessDialog({
    Key? key,
    required this.message,
    required this.onContinue,
    this.continueButtonText = 'Ok',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image Stack
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/congrats.png',
                  height: 150,
                  width: 150,
                ),
                Image.asset(
                  'assets/images/success.png',
                  height: 120,
                  width: 120,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Custom Styled Message
            Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(
                'Roboto Flex',
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  height: 1.25, // Line height = 125%
                  letterSpacing: -0.26, // -2% of 13px
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Styled OK Button
            SizedBox(
              width: 80,
              height: 35,
              child: ElevatedButton(
                onPressed: onContinue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2D70C7),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 0, // height handled by SizedBox
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  continueButtonText,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
