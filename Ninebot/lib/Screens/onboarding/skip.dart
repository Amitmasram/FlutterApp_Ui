import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ninebot/Screens/home_screen.dart';
import 'package:ninebot/Utils/Space.dart';
import 'package:ninebot/Utils/styles.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 700,
      left: 229,
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return HomeScreen();
              }), (route) => false);
            },
            child: Container(
              height: 80,
              width: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [accent, accentDark]),
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100))),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(children: [
                    Text(
                      'Skip',
                      style: p6,
                    ),
                    10.pw,
                    const Icon(
                      Icons.arrow_forward,
                      size: 35,
                    )
                  ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
