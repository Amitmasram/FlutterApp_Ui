import 'package:flutter/material.dart';
import 'pages/detail_page.dart';
import 'pages/home_page.dart';
import 'pages/on_boarding_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFT-Market',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const OnBoardingPage(),
        '/home': (context) => HomePage(),
        '/detail-page': (context) => const DetailPage(),
      },
    );
  }
}
