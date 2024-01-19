// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../theme.dart';

class Button extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final Color fontColor;
  final double fontSize;
  final Color backgroundColor;
  final VoidCallback onClick;

  const Button({
    Key? key,
    required this.title,
    this.width = 350,
    this.height = 70,
    this.fontColor = kWhiteColor,
    this.fontSize = 20,
    this.backgroundColor = kGreenColor,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          border: Border.all(width: 1, color: kGreyColor),
          color: backgroundColor,
        ),
        child: Center(
          child: Text(
            title,
            style: whiteTextStyle.copyWith(
              fontSize: fontSize,
              fontWeight: bold,
              color: fontColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
