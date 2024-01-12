import 'package:flutter/material.dart';

import 'package:social_app/page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social App',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const MainPage(),
    );
  }
}
