import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'introduction/introduction_view.dart';

void main() {
  runApp(const MyApp());
}

// Medition App
// Follow on github
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
        theme: ThemeData(
            primarySwatch: Colors.green,
            scaffoldBackgroundColor: Colors.black54),
        home: const IntroductionView());
  }
}
