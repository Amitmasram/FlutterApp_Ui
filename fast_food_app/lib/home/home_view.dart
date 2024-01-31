import 'package:fast_food_app/detailPage/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/circular_grapgh.dart';
import 'components/info_column.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("Hello Jennifer",
              style: TextStyle(color: Colors.white, fontSize: 20)),
          actions: const [
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            SizedBox(width: 10)
          ]),
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        const SizedBox(height: 30),
        Center(
            child: SizedBox(
          height: 230,
          width: 230,
          child: CircularGraph(),
        )),
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 44),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CustomInfoColumns(
                numbersOfIngredients: '1382',
                title: 'CONSUMED',
              ),
              CustomInfoColumns(
                numbersOfIngredients: '471',
                title: 'BURNED',
              ),
              CustomInfoColumns(
                numbersOfIngredients: '912',
                title: 'NET',
              ),
            ],
          ),
        ),
        const SizedBox(height: 50),
        const Divider(color: Colors.grey),
        const SizedBox(height: 50),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Popular",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 30),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemBuilder: (ctx, i) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => const DetailPageView());
                },
                child: Container(
                  height: 150,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage('assets/pizza.jpg'),
                          fit: BoxFit.cover)),
                ),
              );
            },
            separatorBuilder: (ctx, i) => const SizedBox(height: 20),
            itemCount: 2)
      ]),
    );
  }
}
