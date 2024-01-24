import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  const CustomFloatingButton(
      {super.key, required this.onTap, required this.icon});

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
            gradient: LinearGradient(colors: [
              Colors.red.shade100,
              Colors.red.shade900,
            ]),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                color: Colors.red.shade100,
                blurRadius: 16.0,
              ),
              BoxShadow(
                offset: const Offset(0, 0),
                color: Colors.red.shade200,
                blurRadius: 16.0,
              ),
              BoxShadow(
                offset: const Offset(0, 0),
                color: Colors.red.shade300,
                blurRadius: 16.0,
              ),
            ]),
        child: Icon(
         icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
