import 'package:flutter/material.dart';

import 'custom_bottom_bar_item.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  List<IconData> icons = [
    Icons.home,
    Icons.settings,
    Icons.person_search_rounded,
    Icons.person_rounded
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      padding: const EdgeInsets.all(8),
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: Colors.white.withOpacity(0.1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            4,
            (index) => CustomBottomBarItem(
                icon: icons[index],
                isSelected: selectedIndex == index ? true : false,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                })),
      ),
    );
  }
}
