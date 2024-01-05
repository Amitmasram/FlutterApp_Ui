import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_store/view/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _next();
    super.initState();
  }

  _next() {
    Timer(
      const Duration(milliseconds: 2400),
      () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/splash.jpeg'), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 80),
            Row(
              children: [
                const SizedBox(width: 30),
                Column(
                  children: [
                    Text(
                      'Luxury Brands\nExceptional Prices',
                      style: GoogleFonts.oswald(
                        fontSize: 22,
                        color: Colors.amber[100],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Image.asset(
                          'assets/nike.png',
                          height: 30,
                          color: Colors.amber[100],
                        ),
                        Image.asset(
                          'assets/adidas.png',
                          height: 30,
                          color: Colors.amber[100],
                        ),
                        Image.asset(
                          'assets/logo.png',
                          height: 30,
                          color: Colors.amber[100],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text(
              'Our Best',
              style: GoogleFonts.oswald(
                fontSize: 30,
                color: Colors.amber[100],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Collection\nfor you'.toUpperCase(),
              textAlign: TextAlign.center,
              style: GoogleFonts.oswald(
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  fontSize: 55,
                  color: Colors.amber[100],
                  textBaseline: TextBaseline.alphabetic),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
