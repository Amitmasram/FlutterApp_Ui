// ignore_for_file: file_names

import 'package:bloc_practice/utils/Navigation.dart';
import 'package:bloc_practice/utils/appColors.dart';
import 'package:bloc_practice/utils/styles.dart';
import 'package:bloc_practice/view/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4))
        .then((value) => Navigation.replace(context, const MyHomePage()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Styles.container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width*0.9,
          /*Lottie animation is used. don't forget to give
            the proper path in pubspec.yaml 
            - assets/splash.json*/
          child: Lottie.asset('assets/splash.json')
        )));
  }
}
