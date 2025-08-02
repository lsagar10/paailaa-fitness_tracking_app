import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paailaa/src/core/constants/colors.dart';
import 'package:paailaa/src/features/add%20food/presentation/screen/add_food_section.dart';
import 'package:paailaa/src/features/add%20food/presentation/widget/custom_searchbar.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_buttom.dart';
import 'package:paailaa/src/features/home/presentation/widgets/food_tile.dart';
import 'package:paailaa/src/widgets/success_dialog.dart';

class AddFood extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  AddFood({super.key});

  final List<Map<String, dynamic>> foodItems = [
    {
      'name': "Grilled Chicken Salad",
      'imagePath': "assets/images/chicken.png",
      'calories': 350,
      'carbs': 12,
      'protein': 40,
      'fat': 15,
      'sodium': 500,
      'volume': "1 ltr",
      'description':
          "A fresh grilled chicken salad with romaine, cherry tomatoes, cucumber, and avocado. Perfect balance of protein and freshness.A fresh grilled chicken salad with romaine, cherry tomatoes, cucumber, and avocado. Perfect balance of protein and freshness.A fresh grilled chicken salad with romaine, cherry tomatoes, cucumber, and avocado. Perfect balance of protein and freshness.A fresh grilled chicken salad with romaine, cherry tomatoes, cucumber, and avocado. Perfect balance of protein and freshness.A fresh grilled chicken salad with romaine, cherry tomatoes, cucumber, and avocado. Perfect balance of protein and freshness.",
    },
    {
      'name': "Avocado Toast",
      'imagePath': "assets/images/avocado.png",
      'calories': 280,
      'carbs': 22,
      'protein': 7,
      'fat': 18,
      'sodium': 300,
      'volume': "200 gm",
      'description':
          "Crunchy toast with mashed avocado, cherry tomatoes, and sesame seeds. Packed with healthy fats.",
    },
    {
      'name': "Greek Yogurt Parfait",
      'imagePath': "assets/images/parfait.png",
      'calories': 220,
      'carbs': 28,
      'protein': 12,
      'fat': 7,
      'sodium': 100,
      'volume': "150 ml",
      'description':
          "Greek yogurt layered with granola and berries. Great mix of protein and carbs for a refreshing snack.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/nav_analytics.svg',
              height: 24,
              width: 24,
              colorFilter: const ColorFilter.mode(
                Color(0xFF2D70C7),
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 20),
            const Text(
              'Add Food',
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
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSearchField(
                controller: _searchController,
                hintText: 'Search here',
                textInputAction: TextInputAction.search,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 33.h),
              Row(
                children: [
                  Text(
                    'All Foods',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      height: 1.0,
                      letterSpacing: 0.0,
                      color: primaryColor,
                    ),
                  ),
                  Spacer(),
                  CustomButton(
                    text: 'Add Food',
                    height: 25,
                    width: 85,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddFoodSection(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              ...foodItems.map(
                (food) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: FoodTile(
                    item: FoodItem(
                      name: food['name'],
                      calories: food['calories'],
                      imagePath: food['imagePath'],
                      fullDetails: food,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
