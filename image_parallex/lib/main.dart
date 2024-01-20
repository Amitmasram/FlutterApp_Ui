import 'package:flutter/material.dart';

import 'package:image_parallex/view/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image_Parallex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'timesBold'),
      home: const HomeScreen(),
    );
  }
}
