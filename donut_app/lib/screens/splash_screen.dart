import 'dart:async';

import 'package:flutter/material.dart';

import '../core/animations/page_transition.dart';
import '../core/utils/navigation.dart';
import 'home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _next();
    super.initState();
  }

  _next() {
    Timer(
      const Duration(milliseconds: 1500),
      () {
        Navigation.push(
          context,
          customPageTransition: PageTransition(
            child: const HomeScreen(),
            type: PageTransitionType.fadeIn,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/donut/donut_6.png'),
              const SizedBox(height: 40),
              const Text(
                'Taste the Sweetnes',
                style: TextStyle(color: Colors.amber, fontSize: 40),
              )
            ],
          ),
        ));
  }
}
