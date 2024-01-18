import 'package:flutter/material.dart';
import 'package:medical_app/style/app_style.dart';

import 'components/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor Appointment',
      theme: AppStyle.theme,
      home: const BottomBar(),
    );
  }
}
