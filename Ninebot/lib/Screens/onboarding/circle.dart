import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:ninebot/Utils/styles.dart';

class Circlepoint extends StatelessWidget {
  const Circlepoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 155,
      left: 240,
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                border: GradientBoxBorder(
                    gradient: LinearGradient(colors: [
                  accent, const Color(0x00ACFD3E)
                  //Color(0xFF607476), Color(0x00607476)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                gradient: LinearGradient(
                    colors: [bgIcon, bgIcon],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Container(
                padding: const EdgeInsets.only(top: 4),
                height: 13,
                width: 13,
                decoration: BoxDecoration(
                    border: GradientBoxBorder(
                        gradient: LinearGradient(
                            colors: [accent, const Color(0x00ACFD3E)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    borderRadius: BorderRadius.circular(100),
                    color: accent),
                child: Column(
                  children: [],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
