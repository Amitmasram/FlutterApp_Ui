import 'package:expandable_text/expandable_text.dart';
import 'package:fast_food_app/constants.dart';
import 'package:fast_food_app/detailPage/components/custom_grapghs.dart';
import 'package:fast_food_app/home/components/info_column.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPageView extends StatefulWidget {
  const DetailPageView({super.key});

  @override
  State<DetailPageView> createState() => _DetailPageViewState();
}

class _DetailPageViewState extends State<DetailPageView> {
  double turns = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Center(
              child: Container(
            height: 250,
            width: 250,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/food.png'), fit: BoxFit.cover)),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CustomInfoColumns(title: 'SERVES', numbersOfIngredients: '4'),
              CustomInfoColumns(title: 'COOKS IN', numbersOfIngredients: '1H'),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "Chicken & Spring green bun cha",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 34,
                height: 1.3,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          ExpandableText(
            longText,
            expandText: 'show more',
            collapseText: 'show less',
            maxLines: 5,
            style: GoogleFonts.poppins(color: Colors.grey),
            linkColor: CustomColors.kYellow,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomGraph(
                quantity: '478',
                vitamins: 'CAL',
                dataMap: dataMap,
              ),
              CustomGraph(
                quantity: '78g',
                vitamins: 'FATS',
                dataMap: dataMap2,
              ),
              CustomGraph(
                quantity: '28g',
                vitamins: 'CARBS',
                dataMap: dataMap3,
              ),
              CustomGraph(
                quantity: 'PROT',
                vitamins: '24',
                dataMap: dataMap4,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
              height: 54,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [CustomColors.kYellow, CustomColors.kOrange])),
              child: const Text("\$ 4.99 / Add to Cart",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)))
        ],
      ),
    );
  }

  final dataMap = <String, double>{
    "Completed": 34,
  };
  final dataMap2 = <String, double>{
    "Completed": 82,
  };
  final dataMap3 = <String, double>{
    "Completed": 42,
  };
  final dataMap4 = <String, double>{
    "Completed": 26,
  };
}
