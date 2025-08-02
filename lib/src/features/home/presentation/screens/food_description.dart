import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paailaa/src/core/constants/colors.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_buttom.dart';
import 'package:paailaa/src/widgets/success_dialog.dart';

class FoodDescriptionPage extends StatelessWidget {
  final Map<String, dynamic> foodData;

  const FoodDescriptionPage({super.key, required this.foodData});

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
              'Food Description',
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              foodData['imagePath'],
              height: 230,

              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              foodData['name'],
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600, // equivalent to 600, SemiBold
                fontSize: 16,
                height: 1.25, // line height 125%
                letterSpacing:
                    -0.02 *
                    16, // letterSpacing in Flutter is in logical pixels, so -2% of fontSize = -0.32
              ),
            ),

            const SizedBox(height: 10),
            Text(
              foodData['description'] ?? 'No description available.',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400, // Regular
                fontSize: 14,
                height: 1.25, // 125% line height
                letterSpacing: -0.02 * 14, // -2% of 14 = -0.28
              ),
            ),

            const SizedBox(height: 16),
            Text(
              'Nutritional Facts',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600, // equivalent to 600, SemiBold
                fontSize: 16,
                height: 1.25, // line height 125%
                letterSpacing:
                    -0.02 *
                    16, // letterSpacing in Flutter is in logical pixels, so -2% of fontSize = -0.32
              ),
            ),
            const SizedBox(height: 8),
            Table(
              border: TableBorder.all(color: Colors.grey),
              children: [
                buildRow('Calories', '${foodData['calories']} kcal'),
                buildRow('Carbs', '${foodData['carbs']} gram'),
                buildRow('Protein', '${foodData['protein']} gram'),
                buildRow('Fat', '${foodData['fat']} gram'),
                buildRow('Sodium', '${foodData['sodium']} milg'),
                buildRow('Volume', foodData['volume']),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              textAlign: TextAlign.center, // Horizontal text alignment
              style: GoogleFonts.robotoFlex(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 1.25,
                letterSpacing: -0.02 * 16, // -2% of font size
                color: Colors.grey, // Text color
              ),
              decoration: InputDecoration(
                hintText: 'Enter the quantity in gram.',
                hintStyle: GoogleFonts.robotoFlex(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  height: 1.25,
                  letterSpacing: -0.02 * 16,
                  color: Colors.grey, // Hint text color
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_circle, color: primaryColor),
                ),
                const Text("1"),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_circle, color: primaryColor),
                ),
                const Spacer(),
                CustomButton(
                  text: 'Add Food',
                  width: 111,
                  height: 33,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => SuccessDialog(
                        message: 'Successfully! Added the Food',
                        onContinue: () => Navigator.pop(context),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TableRow buildRow(String label, String value) {
    final textStyle = GoogleFonts.roboto(
      fontWeight: FontWeight.w400, // Regular
      fontSize: 16,
      height: 1.25, // 125% line height
      letterSpacing: -0.02 * 16, // -2% of 16px = -0.32
    );

    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(label, textAlign: TextAlign.center, style: textStyle),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(value, textAlign: TextAlign.center, style: textStyle),
        ),
      ],
    );
  }
}
