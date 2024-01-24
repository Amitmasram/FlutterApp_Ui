import 'package:flutter/material.dart';

class CustomBottomBarItem extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final bool isSelected;
  const CustomBottomBarItem(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? null : Colors.white.withOpacity(0.1),
            gradient: isSelected
                ? LinearGradient(colors: [
                    Colors.red.shade100,
                    Colors.red.shade900,
                  ])
                : null,
            boxShadow: [
              isSelected
                  ? BoxShadow(
                      offset: const Offset(0, 0),
                      color: Colors.red.shade100,
                      blurRadius: 10.0,
                    )
                  : const BoxShadow(),
              isSelected
                  ? BoxShadow(
                      offset: const Offset(0, 0),
                      color: Colors.red.shade200,
                      blurRadius: 10.0,
                    )
                  : const BoxShadow(),
              isSelected
                  ? BoxShadow(
                      offset: const Offset(0, 0),
                      color: Colors.red.shade300,
                      blurRadius: 10.0,
                    )
                  : const BoxShadow(),
            ]),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
