import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:ninebot/Utils/styles.dart';

class Mph extends StatelessWidget {
  const Mph({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 265,
      left: 26,
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
            height: 150,
            width: 100,
            decoration: BoxDecoration(
                border: GradientBoxBorder(
                    gradient: LinearGradient(colors: [
                  accent, Color(0x00ACFD3E)
                  //Color(0xFF607476), Color(0x00607476)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                gradient: LinearGradient(
                    colors: [bgIcon, bgIcon],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(14)),
            child: Center(
              child: Column(children: [
                Container(
                  height: 78,
                  width: 100,
                  decoration: BoxDecoration(
                      border: GradientBoxBorder(
                          gradient: LinearGradient(
                              colors: [accent, Color(0x00ACFD3E)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                      borderRadius: BorderRadius.circular(14),
                      color: bgIcon),
                  child: Column(
                    children: [
                      Icon(
                        Icons.speed_outlined,
                        color: accent,
                      ),
                      Text(
                        '23.0',
                        style: TextStyle(
                            color: text,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'mph',
                        style: TextStyle(color: Colors.white70),
                      )
                    ],
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

    //
    // Container(
    //   height: 150,
    //   width: 100,
    //   decoration: BoxDecoration(
    //       border: GradientBoxBorder(
    //           gradient: LinearGradient(
    //               colors: [Color(0xFF607476), Color(0x00607476)])),
    //       gradient: LinearGradient(colors: [accent]),
    //       borderRadius: BorderRadius.circular(14)),
    // );
  
