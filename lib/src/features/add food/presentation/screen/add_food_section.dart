import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paailaa/src/core/constants/colors.dart';

class AddFoodSection extends StatelessWidget {
  const AddFoodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes default back icon
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // Go back
              },
              child: SvgPicture.asset(
                'assets/icons/back.svg', // Replace with your SVG path
                height: 39,
                width: 39,
                color: primaryColor,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              'Add Food',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ],
        ),
        centerTitle: false,
        elevation: 0,
      ),
    );
  }
}
