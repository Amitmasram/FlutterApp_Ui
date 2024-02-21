import 'package:fashion/utils/colors.dart';
import 'package:flutter/material.dart';

import 'screens/nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'T-Shirt Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColors.buttonColor,
          textTheme: ButtonTextTheme.primary,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.secondaryColor,
        ),
      ),
      home: const NavBar(),
    );
  }
}
