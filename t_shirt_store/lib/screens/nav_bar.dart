import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'home_screen.dart';
import 'product_screen.dart';

List<Widget> screens = [
  const HomeScreen(),
  const ProductsScreen(),
];

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: screens[_currentIndex],
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey.shade900,
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          selectedFontSize: 0,
          iconSize: 30,
          enableFeedback: true,
          unselectedFontSize: 0,
          onTap: (index) {
            if (index <= 1) {
              setState(() {
                _currentIndex = index;
              });
            }
          },
          selectedItemColor: AppColors.buttonColor,
          unselectedItemColor: AppColors.tertiaryColor.withOpacity(0.8),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.space_dashboard_rounded,
                ),
                label: "Shop"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_rounded), label: "Shop"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          ]),
    );
  }
}
