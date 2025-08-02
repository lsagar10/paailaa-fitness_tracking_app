import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paailaa/src/core/constants/colors.dart';

class BottomNavBar extends StatefulWidget {
  final List<Widget> screens;
  final int initialIndex;

  const BottomNavBar({Key? key, required this.screens, this.initialIndex = 0})
    : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _selectedIndex;

  final Color _inactiveColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem buildNavItem(
    String assetPath,
    String label,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            assetPath,
            color: _selectedIndex == index ? primaryColor : _inactiveColor,
            height: 24,
          ),
          const SizedBox(height: 4), // Gap between icon and label
        ],
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: primaryColor,
        unselectedItemColor: _inactiveColor,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(height: 1.0),
        unselectedLabelStyle: const TextStyle(height: 1.0),
        items: [
          buildNavItem('assets/icons/nav_home.svg', "Home", 0),
          buildNavItem('assets/icons/nav_plans.svg', "Plans", 1),
          buildNavItem('assets/icons/nav_add.svg', "Add Food", 2),
          buildNavItem('assets/icons/nav_analytics.svg', "Analytics", 3),
          buildNavItem('assets/icons/nav_profile.svg', "Profile", 4),
        ],
      ),
    );
  }
}
