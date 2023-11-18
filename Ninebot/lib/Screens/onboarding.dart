import 'package:flutter/material.dart';

import 'package:ninebot/Screens/onboarding/circle.dart';
import 'package:ninebot/Screens/onboarding/skip.dart';
import 'package:ninebot/Screens/onboarding/speed.dart';
import 'package:ninebot/Utils/Space.dart';
import 'package:ninebot/Utils/styles.dart';

import 'onboarding/labels.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final scheme = theme.colorScheme;
    // final style = theme.textTheme;

    return Scaffold(
      backgroundColor: bgMed,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 16, top: 40),
          child: Text(
            'ninebot',
            style: TextStyle(
                color: Color.fromARGB(255, 243, 240, 240),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            Column(children: [
              50.ph,
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(text: Labels.gokart, style: h1, children: [
                    WidgetSpan(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        Labels.pro,
                        style: h3,
                      ),
                    )),
                    TextSpan(text: Labels.upped, style: h4)
                  ])),
              30.ph,
              Container(
                height: 430,
                width: 500,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/kart-8.png'),
                      fit: BoxFit.cover),
                ),
              ),
              // child: Image.asset('assets/images/kart-8.png')),
              30.ph,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 150),
                child: LinearProgressIndicator(
                  color: Color(0xFFACFD3E),
                ),
              )
            ]),
            Circlepoint(),
            Mph(),
            SkipButton()
          ],
        ),
      ),
    );
  }
}
