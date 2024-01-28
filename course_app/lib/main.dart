import 'package:flutter/material.dart';
import 'view/home/home.dart';

void main() {
  runApp(const MyApp());
}
// Follow me on instagram and Linkdlin - Amitmasram

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course_App ',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}
