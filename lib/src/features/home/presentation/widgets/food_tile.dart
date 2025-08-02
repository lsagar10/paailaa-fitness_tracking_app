import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodItem {
  final String name;
  final int calories;
  final String imagePath;
  final Map<String, dynamic> fullDetails; // ← NEW

  FoodItem({
    required this.name,
    required this.calories,
    required this.imagePath,
    required this.fullDetails,
  });
}

class FoodTile extends StatelessWidget {
  final FoodItem item;

  const FoodTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/foodDescription',
          arguments: item.fullDetails,
        );
      },
      child: Container(
        height: 62,
        width: 355,
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12), // darker shadow
              blurRadius: 12, // softer edges
              spreadRadius: 2, // expand shadow coverage
              offset: const Offset(0, 6), // move shadow down
            ),
          ],
        ),

        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(item.imagePath),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Calories: ${item.calories}",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
