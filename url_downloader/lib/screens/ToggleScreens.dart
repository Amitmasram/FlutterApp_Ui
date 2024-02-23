import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;
import 'package:saqib_downloader/provider/bottom_navbar_provider.dart';
import 'package:saqib_downloader/screens/home_screen.dart';
import 'package:saqib_downloader/utils/colors.dart';

import 'all_media_page.dart';

class ToggleScreens extends StatefulWidget {
  const ToggleScreens({super.key});

  @override
  State<ToggleScreens> createState() => _ToggleScreensState();
}

class _ToggleScreensState extends State<ToggleScreens> {
  final List<Widget> screens = [
    const HomeScreen(),
    const AllMediaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bottomNavBarProvider = Provider.of<BottomNavBarProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'SR Downloader',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: IndexedStack(
        index: bottomNavBarProvider.currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.media_bluetooth_on_outlined),
              label: 'All Media'),
        ],
        currentIndex: bottomNavBarProvider.currentIndex,
        onTap: (index) {
          bottomNavBarProvider.setCurrentIndex(index);
        },
        selectedFontSize: size.width * 0.045,
        selectedItemColor: ColorsTheme.tealColor,
      ),
    );
  }
}
