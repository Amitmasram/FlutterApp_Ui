import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shoes_store/data/data.dart';
import 'package:shoes_store/view/detail_screen.dart';

import '../const/CustomIcon.dart';
import '../widget/ProductCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List bottomNavIconList = [
    Image.asset(
      "assets/store.png",
      width: 20.0,
      height: 25.0,
    ),
    const Icon(
      CustomIcons.search,
      size: 25.0,
    ),
    const Icon(
      CustomIcons.favorite,
      size: 25.0,
    ),
    const Icon(CustomIcons.cart, size: 25.0),
    Image.asset("assets/profile.png", width: 35.0, height: 25.0)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(137, 99, 97, 97), Color(0xFF000000)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        itemCount: Data.datalist.length,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DetailScreen(
                                          datalist: Data.datalist[index],
                                        ))),
                            child: ProductCard(
                              datalist: Data.datalist[index],
                            ),
                          );
                        }))
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * .08,
        decoration: BoxDecoration(color: Colors.white54, boxShadow: [
          BoxShadow(
              color: Colors.black12.withOpacity(0.065),
              offset: const Offset(0.0, -3.0),
              blurRadius: 10.0)
        ]),
        child: Row(
          children: bottomNavIconList.map((item) {
            var index = bottomNavIconList.indexOf(item);
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: bottomNavItem(item, index == _currentIndex),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

bottomNavItem(Widget item, bool isSelected) => Container(
      decoration: BoxDecoration(
          boxShadow: isSelected
              ? [
                  BoxShadow(
                      color: Colors.black12.withOpacity(0.02),
                      offset: const Offset(0.0, 5.0),
                      blurRadius: 10.0)
                ]
              : []),
      child: item,
    );
