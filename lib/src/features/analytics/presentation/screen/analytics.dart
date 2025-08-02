import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paailaa/src/features/authentication/analytics_detailed_page.dart';

class Analytics extends StatelessWidget {
  const Analytics({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_AnalyticsItem> items = [
      _AnalyticsItem(
        iconPath: 'assets/icons/analytics/steps.svg',
        label: "Steps Count",
        data: [200, 400, 500, 400, 300, 600, 200],
        unit: "steps",
      ),
      _AnalyticsItem(
        iconPath: 'assets/icons/analytics/calories.svg',
        label: "Calories Consumed",
        data: [300, 200, 350, 200, 200, 050, 150],
        unit: "kcal",
      ),
      _AnalyticsItem(
        iconPath: 'assets/icons/analytics/carbs.svg',
        label: "Carbs Consumed",
        data: [180, 200, 190, 220, 210, 195, 205],
        unit: "g",
      ),
      _AnalyticsItem(
        iconPath: 'assets/icons/analytics/sodium.svg',
        label: "Sodium Consumed",
        data: [1500, 1600, 1550, 1700, 1650, 1580, 1720],
        unit: "mg",
      ),
      _AnalyticsItem(
        iconPath: 'assets/icons/analytics/fat.svg',
        label: "Fat Consumed",
        data: [60, 70, 65, 75, 80, 68, 72],
        unit: "g",
      ),
      _AnalyticsItem(
        iconPath: 'assets/icons/analytics/protein.svg',
        label: "Protein Consumed",
        data: [90, 100, 95, 105, 110, 98, 102],
        unit: "g",
      ),
      _AnalyticsItem(
        iconPath: 'assets/icons/analytics/water.svg',
        label: "Water Consumed",
        data: [1500, 1800, 1700, 1600, 1900, 2000, 1950],
        unit: "ml",
      ),
    ];

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
              'Analytics',
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your personalized health insights based on daily activities and nutrition patterns.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                letterSpacing: -0.32,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return _buildCard(context, items[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, _AnalyticsItem item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AnalyticsDetailPage(
              title: item.label,
              iconPath: item.iconPath,
              data: item.data,
              unit: item.unit,
            ),
          ),
        );
      },
      child: SizedBox(
        width: 135,
        height: 123,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                item.iconPath,
                height: 36,
                width: 36,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF2D70C7),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 21),
              Text(
                item.label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  height: 1.0,
                  letterSpacing: -0.26,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnalyticsItem {
  final String iconPath;
  final String label;
  final List<int> data;
  final String unit;

  _AnalyticsItem({
    required this.iconPath,
    required this.label,
    required this.data,
    required this.unit,
  });
}
