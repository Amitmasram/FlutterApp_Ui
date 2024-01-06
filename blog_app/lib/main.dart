import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog_App',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const CupertinoScrollBehavior(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kprimaryColor),
        useMaterial3: true,
        fontFamily: "Avenir",
        textTheme: const TextTheme(
          titleSmall: TextStyle(
            fontFamily: "Avenir",
            color: kprimaryTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          titleMedium: TextStyle(
            fontFamily: "Avenir",
            color: ksecondaryTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w200,
          ),
          titleLarge: TextStyle(
            fontFamily: "Avenir",
            fontWeight: FontWeight.bold,
            color: kprimaryTextColor,
            fontSize: 18,
          ),
          headlineMedium: TextStyle(
            fontFamily: "Avenir",
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: kprimaryTextColor,
          ),
          headlineSmall: TextStyle(
            fontFamily: "Avenir",
            fontSize: 20,
            color: kprimaryTextColor,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(
            fontFamily: "Avenir",
            color: ksecondaryTextColor,
            fontSize: 12,
          ),
          bodySmall: TextStyle(
            fontFamily: "Avenir",
            fontWeight: FontWeight.w700,
            fontSize: 10,
            color: Color(0xff7B8BB2),
          ),
          bodyLarge: TextStyle(
            fontFamily: "Avenir",
            color: kprimaryTextColor,
            fontSize: 14,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
