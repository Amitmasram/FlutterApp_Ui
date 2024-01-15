import 'package:flutter/material.dart';
import 'package:smart_app/data/constants.dart';

class CustomIcons extends StatelessWidget {
  final IconData icon;

  const CustomIcons({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: CustomColor.kBackground1)),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Icon(icon, color: Colors.white),
    );
  }
}
