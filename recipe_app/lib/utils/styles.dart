import 'package:bloc_practice/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Styles {
  static container(
      {required Widget child, double height = 10, double width = 10}) {
    return Container(
      margin: const EdgeInsets.all(12),
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 7,
              color: blackColor.withOpacity(0.5),
              offset: const Offset(2, 3))
        ],
        color: secondaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }

  static plate(
      {required String imageUrl, double height = 100, double width = 100}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/plate.png',
          height: height,
          width: width,
        ).animate().then(
          delay: 1.2.seconds
        ).shake(
          offset: const Offset(10, 10)
        ),
        ClipOval(
                child: Image.network(
          imageUrl,
          fit: BoxFit.fill,
          width: width / 2,
          height: height / 2,
        ))
            .animate().fadeIn(
              delay: 500.ms,)
            .then(
              delay: 70.ms,
              curve: Curves.easeInOut
            )
            .move(begin: const Offset(-50, -50), end: const Offset(0, 0)).then(delay: 50.ms).shake(offset: const Offset(10, 10)).then(delay: 1.seconds).rotate(begin: 0),
      ],
    );
  }
}
