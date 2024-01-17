import 'package:flutter/material.dart';

class BackgroundCircle extends StatelessWidget {
  final circleBorderWidth;
  final circleOpacity;
  final circleWidth;
  final circleColor;

  const BackgroundCircle({
    super.key,
    required this.circleBorderWidth,
    required this.circleOpacity,
    required this.circleWidth,
    required this.circleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: circleWidth,
      width: circleWidth,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: circleColor.withOpacity(circleOpacity),
              width: circleBorderWidth)),
    );
  }
}
