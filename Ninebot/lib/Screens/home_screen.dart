import 'package:flutter/material.dart';

import 'package:ninebot/Utils/styles.dart';

import 'package:ninebot/components/bottom_section.dart';

import 'package:ninebot/components/middle_section.dart';
import 'package:ninebot/components/top_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDark,
      body: SafeArea(
          child: ListView(scrollDirection: Axis.vertical, children: [
        Stack(
          children: [
            Column(children: const [TopSection(), BottomSection()]),
            MiddleSection()
          ],
        )
      ])),
    );
  }
}
