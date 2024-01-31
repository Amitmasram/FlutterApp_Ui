// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:fast_food_app/constants.dart';

class CustomGraph extends StatelessWidget {
  final String vitamins;
  final String quantity;
  Map<String, double> dataMap;
  CustomGraph({
    Key? key,
    required this.vitamins,
    required this.quantity,
    required this.dataMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
              boxShadow: [
                BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 1)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(vitamins,
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 10,
                  )),
              Text(quantity,
                  style:
                      GoogleFonts.poppins(color: Colors.white, fontSize: 14)),
            ],
          ),
        ),
        RepaintBoundary(
          child: PieChart(
            dataMap: dataMap,
            animationDuration: const Duration(milliseconds: 800),
            chartRadius: 60,
            initialAngleInDegree: 270,
            baseChartColor: Colors.transparent,
            totalValue: 100,
            chartType: ChartType.ring,
            ringStrokeWidth: 2,
            gradientList: [colorList],
            legendOptions: const LegendOptions(showLegends: false),
            chartValuesOptions: const ChartValuesOptions(
              showChartValues: false,
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
            ),
          ),
        ),
      ],
    );
  }


  

  final colorList = <Color>[
    CustomColors.kOrange,
    CustomColors.kYellow,
  ];
}
