import 'package:flutter/material.dart';

class CustomIcons extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  const CustomIcons({super.key, this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(11),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(icon),
      ),
    );
  }
}
