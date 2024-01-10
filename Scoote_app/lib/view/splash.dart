import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoote_app/view/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 4200), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff262f26),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInLeft(
              duration: const Duration(milliseconds: 1200),
              child: Image.asset('images/splash.png')),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: BounceInDown(
              delay: const Duration(milliseconds: 2000),
              child: Text(
                'Where',
                style: GoogleFonts.kaushanScript(
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                    fontSize: MediaQuery.of(context).size.width * 0.2),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: FlipInX(
              duration: const Duration(milliseconds: 1200),
              delay: const Duration(milliseconds: 1200),
              child: Text(
                "Style Meet Speed !",
                style: GoogleFonts.kalam(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.105),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
