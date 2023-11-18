import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:ninebot/Utils/Space.dart';
import 'package:ninebot/Utils/styles.dart';

class MyCard extends StatelessWidget {
  final String image;
  final String name;
  final double price;
  const MyCard(
      {super.key,
      required this.image,
      required this.name,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(10),
      height: 160,
      width: 100,
      decoration: BoxDecoration(
          border: const GradientBoxBorder(
            gradient: LinearGradient(colors: [
              Color(0xFF607476),
              Color(0x00607476),
              Color(0x00607476)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          gradient: LinearGradient(
              colors: [bgIcon, const Color(0xFF0C1013)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(18)),
      child: Column(children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: GradientBoxBorder(
                  gradient: LinearGradient(colors: [
                accent,
                Color(0x00ACFD3E),
                Color(0x00ACFD3E),
                Color(0x00ACFD3E),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              image: DecorationImage(image: AssetImage(image))),
        ),
        10.ph,
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Column(
            children: [
              Text(
                name,
                style: p1Light,
              ),
              Text(
                'USD $price',
                style: p1Dark,
              )
            ],
          ),
        )
      ]),
    );
  }
}
