import 'package:flutter/material.dart';
import 'view/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course_App',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}
