import 'package:flutter/material.dart';
import 'package:paailaa/src/features/add%20food/presentation/screen/add_food.dart';
import 'package:paailaa/src/features/analytics/presentation/screen/analytics.dart';
import 'package:paailaa/src/features/home/presentation/screens/homepage.dart';
import 'package:paailaa/src/features/plans/presentation/screen/plans.dart';
import 'package:paailaa/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:paailaa/src/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavBar(
      screens: [Homepage(), Plans(), AddFood(), Analytics(), ProfileScreen()],
    );
  }
}
