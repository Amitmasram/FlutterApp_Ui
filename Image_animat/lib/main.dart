import 'package:flutter/material.dart';
import 'package:flutter_animated_starter/screens/getstarted.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '3D Effect & Animations',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: const GetStarted(),
    );
  }
}
