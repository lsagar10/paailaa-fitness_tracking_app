import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paailaa/src/features/profile/presentation/screens/body_goal.dart';
import 'package:paailaa/src/features/profile/presentation/screens/demographic_info.dart';
import 'package:paailaa/src/features/profile/presentation/screens/health_data.dart';
import 'package:paailaa/src/features/profile/presentation/screens/profile_information.dart';
import 'package:paailaa/src/features/profile/presentation/widgets/profile_widget.dart';

class MyInformation extends StatelessWidget {
  const MyInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            width: 39,
            height: 39,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'My Information',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.black,
          ),
        ),

        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            ProfileListTile(
              iconPath: 'assets/icons/profile/my_info.svg',
              title: 'Profile Information',
              destination: ProfileInformation(),
            ),
            ProfileListTile(
              iconPath: 'assets/icons/profile/demo_info.svg',
              title: 'Demographic Information',
              destination: DemographicInfo(),
            ),
            ProfileListTile(
              iconPath: 'assets/icons/profile/health_data.svg',
              title: 'Health Data',
              destination: HealthData(),
            ),
            ProfileListTile(
              iconPath: 'assets/icons/profile/body_goal.svg',
              title: 'Body Goal',
              destination: BodyGoal(),
            ),
          ],
        ),
      ),
    );
  }
}
