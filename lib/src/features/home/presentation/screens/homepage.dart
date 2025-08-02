import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paailaa/src/core/constants/colors.dart';
import 'package:paailaa/src/features/home/presentation/widgets/calories_indicator_widget.dart';
import 'package:paailaa/src/features/home/presentation/widgets/food_tile.dart';
import 'package:paailaa/src/features/home/presentation/widgets/nutrient_indicator_widget.dart';
import 'package:paailaa/src/features/home/presentation/widgets/step_counter_widget.dart';
import 'package:paailaa/src/features/home/presentation/widgets/water_carbs_progress.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

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
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/icons/homepage/homepage_logo.svg',
                    height: 24,
                    width: 75,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/homepage/alarm.svg',
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(width: 12),
                      SvgPicture.asset(
                        'assets/icons/homepage/notification.svg',
                        height: 24,
                        width: 24,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 16, top: 20, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/sun.gif',
                          height: 58,
                          width: 51,
                        ),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good Afternoon, Sagar!',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Have a great day',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Color(0xFF4D5053),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 22),
                    Row(
                      children: [
                        CircularCaloriesIndicator(percentage: 80),
                        SizedBox(width: 6),
                        NutrientCircularIndicators(
                          proteinPercentage: 80,
                          fatsPercentage: 70,
                          sodiumPercentage: 60,
                          containerColor: Colors.black,
                          progressColor: primaryColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 9),
                    Row(
                      children: [
                        WaterCarbsProgressCard(
                          label: 'Water',
                          goalAmount: 10000,
                          consumedAmount: 6000,
                        ),
                        SizedBox(width: 6),
                        WaterCarbsProgressCard(
                          label: 'Carbs',
                          goalAmount: 1000,
                          consumedAmount: 300,
                        ),
                      ],
                    ),
                    SizedBox(height: 9),
                    const StepCounterWidget(),
                    SizedBox(height: 15),
                    Text(
                      "Today's Food",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: primaryColor,
                      ),
                    ),
                    SizedBox(height: 10),

                    /// ✅ Dynamic List from `foodItems` Map
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
          ],
        ),
      ),
    );
  }
}
