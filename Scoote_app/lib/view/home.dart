import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'detailPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          // Top Line
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                FadeInLeft(
                    child:
                        const Icon(Icons.menu, color: Colors.black, size: 30)),
                const Spacer(),
                FadeInRight(
                  child: Image.asset(
                    'images/icon_search.png',
                    scale: 3,
                  ),
                ),
                const SizedBox(width: 25),
                FadeInRight(
                  child: const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage("images/profile.png"),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: BounceInLeft(
              delay: const Duration(milliseconds: 500),
              child: RichText(
                text: TextSpan(
                    text: 'Pick',
                    style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600),
                    children: const [
                      TextSpan(
                          text: ' the most',
                          style: TextStyle(
                              color: Color(0xFFff583b), fontSize: 28)),
                      TextSpan(
                          text: '\ncomfort Ride !',
                          style: TextStyle(color: Colors.black, fontSize: 28)),
                    ]),
              ),
            ),
          ),
          // Mid Line
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BounceInLeft(
                  delay: const Duration(milliseconds: 500),
                  duration: const Duration(seconds: 1),
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xFFff583b)),
                        child: const Center(
                          child:
                              Icon(Icons.directions_bike, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 25),
                      _containerWidget(),
                      _containerWidget(),
                      _containerWidget(),
                    ],
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const DetailPage(
                                  heroTag: "images/image31.jpg",
                                )));
                      },
                      child: FlipInY(
                        delay: const Duration(milliseconds: 1300),
                        child: Hero(
                          tag: "images/image31.jpg",
                          child: Container(
                            height: 315,
                            width: MediaQuery.of(context).size.width * 0.68,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                    image: AssetImage("images/image1.jpg"),
                                    fit: BoxFit.cover)),
                            child: Stack(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 15, left: 15),
                                  child: Container(
                                    height: 30,
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: const Color(0xFF404941)),
                                    child: Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 25),
                                        child: Text(
                                          '2000 W',
                                          style: GoogleFonts.robotoSlab(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 15, left: 15),
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: const Color(0xFF6a716b)),
                                    child: const Center(
                                      child: Icon(
                                        Icons.flash_on,
                                        color: Colors.amber,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 25, top: 25),
            child: FadeInUp(
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: Colors.black.withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Center(
                          child: Container(
                            height: 31,
                            width: 31,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xFF2a342b)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 31,
                        width: 31,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFF242224)),
                      ),
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 125,
                        width: MediaQuery.of(context).size.width * 0.68,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                                image: AssetImage("images/image2.jpg"),
                                fit: BoxFit.fill)),
                        child: Center(
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:
                                    const Color(0xFFa2a09c).withOpacity(0.6)),
                            child: const Center(
                              child:
                                  Icon(Icons.play_arrow, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              top: 100,
              left: 40,
            ),
            child: FadeInLeft(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Column(
                    children: <Widget>[
                      SizedBox(height: 15),
                      Text(
                        'New',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Icon(Icons.brightness_1,
                          color: Color(0xFFff583b), size: 8)
                    ],
                  ),
                  const SizedBox(width: 60),
                  const Text('Soon',
                      style: TextStyle(color: Colors.grey, fontSize: 18)),
                  const Spacer(),
                  Container(
                    width: 120,
                    height: 80,
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(25)),
                        color: Color(0xFFff583b)),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("more",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          Icon(Icons.keyboard_arrow_down, color: Colors.white)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

_containerWidget() {
  return Column(
    children: [
      Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
          child: Icon(Icons.directions_bike,
              color: Color.fromARGB(255, 139, 136, 136)),
        ),
      ),
      const SizedBox(height: 25)
    ],
  );
}
