// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft_app/pages/home_page.dart';

import '../theme.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 4500), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/splash.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 80.0),
              child: FadeInRight(
                delay: Duration(milliseconds: 1200),
                child: Text(
                  "Digital Aura NFT Marvels!",
                  style: GoogleFonts.merriweather(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.amber,
                    shadows: [
                      Shadow(
                          blurRadius: 20,
                          color: Colors.red,
                          offset: Offset(10, 2)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            FadeInLeft(
                duration: Duration(milliseconds: 1500),
                delay: Duration(milliseconds: 1700),
                child: Padding(
                  padding: const EdgeInsets.only(left: 70.0),
                  child: Text(
                    "Own the Future !",
                    style: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Color.fromARGB(255, 255, 255, 255),
                      shadows: [
                        Shadow(
                            blurRadius: 20,
                            color: Colors.black,
                            offset: Offset(0, 20)),
                      ],
                    ),
                  ),
                )),
            SizedBox(height: MediaQuery.of(context).size.height * .1),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: backgroundImage(),
    );
  }
}
