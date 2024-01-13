import 'package:animate_do/animate_do.dart';
import 'package:course_app/const/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../const/clipper.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFF5F4EF),
          image: DecorationImage(
            image: AssetImage("assets/images/ux_big.png"),
            alignment: Alignment.topRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 20,
                  top: MediaQuery.of(context).size.height * 0.04,
                  right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.keyboard_arrow_left_outlined),
                          iconSize: 35),
                      SvgPicture.asset("assets/icons/more-vertical.svg"),
                    ],
                  ),
                  const SizedBox(height: 30),
                  BounceInLeft(
                    child: ClipPath(
                      clipper: BestSellerClipper(),
                      child: Container(
                        color: Colors.amber,
                        padding: const EdgeInsets.only(
                            left: 10, top: 5, right: 20, bottom: 5),
                        child: Text(
                          "BestSeller".toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ZoomIn(
                    child: Text(
                      "Design Thinking",
                      style: kHeadingextStyle.copyWith(fontSize: 24),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FadeInLeft(
                    delay: const Duration(milliseconds: 300),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/person.svg"),
                        const SizedBox(width: 5),
                        const Text(
                          "18K",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 20),
                        SvgPicture.asset("assets/icons/star.svg"),
                        const SizedBox(width: 5),
                        const Text(
                          "4.8",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  FlipInX(
                    delay: const Duration(milliseconds: 700),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "\$50 ",
                              style: kSubheadingextStyle.copyWith(
                                  color: Colors.black,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold)),
                          const TextSpan(
                            text: "\$70",
                            style: TextStyle(
                              color: Color(0xFF61688B),
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.16),
            Expanded(
              child: FadeInUp(
                delay: const Duration(milliseconds: 700),
                child: Card(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Course Content",
                                style: kTitleTextStyle,
                              ),
                              SizedBox(height: 30),
                              CourseContent(
                                number: "01",
                                duration: 5.35,
                                title: "Welcome to the Course",
                                isDone: true,
                              ),
                              CourseContent(
                                number: '02',
                                duration: 19.04,
                                title: "Design Thinking - Intro",
                                isDone: true,
                              ),
                              CourseContent(
                                number: '03',
                                duration: 15.35,
                                title: "Design Thinking Process",
                              ),
                              CourseContent(
                                number: '04',
                                duration: 5.35,
                                title: "Customer Perspective",
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 50,
                                ),
                              ],
                            ),
                            child: Row(
                              children: <Widget>[
                                FadeInLeft(
                                  delay: const Duration(milliseconds: 1300),
                                  child: Container(
                                    padding: const EdgeInsets.all(14),
                                    height: 56,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFEDEE),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: SvgPicture.asset(
                                        "assets/icons/shopping-bag.svg"),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: BounceInUp(
                                    delay: const Duration(milliseconds: 1300),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 56,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Colors.amber,
                                      ),
                                      child: const Text(
                                        "Buy Now",
                                        style: kTitleTextStyle,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseContent extends StatelessWidget {
  final String number;
  final double duration;
  final String title;
  final bool isDone;
  const CourseContent({
    Key? key,
    required this.number,
    required this.duration,
    required this.title,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: <Widget>[
          Text(
            number,
            style: kHeadingextStyle,
          ),
          const SizedBox(width: 15),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$duration mins\n",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                    text: title,
                    style: kSubtitleTextSyule.copyWith(
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(left: 20),
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amber,
            ),
            child: const Icon(Icons.play_arrow, color: Colors.white),
          )
        ],
      ),
    );
  }
}
