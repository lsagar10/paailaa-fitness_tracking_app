import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_buttom.dart';
import 'package:paailaa/src/widgets/success_dialog.dart';

class UploadImageScreen extends StatelessWidget {
  const UploadImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  border: Border.all(color: Color(0xFF2D70C7)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 18,
                  color: Color(0xFF2D70C7),
                ),
              ),
            ),
            const SizedBox(width: 50),
            Text(
              'Upload Image',
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _uploadOption(
                    'assets/icons/profile/upload_file.svg',
                    'Upload File',
                  ),
                  _uploadOption(
                    'assets/icons/profile/take_photo.svg',
                    'Take Photo',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            CustomButton(
              text: 'Upload',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => SuccessDialog(
                    message: 'Successfully! updated your Image',
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

  Widget _uploadOption(String svgPath, String label) {
    return Column(
      children: [
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: Center(
            child: SvgPicture.asset(
              svgPath,
              height: 30,
              width: 30,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
