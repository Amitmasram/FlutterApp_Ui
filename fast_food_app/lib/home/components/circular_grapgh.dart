import 'package:fast_food_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

class CircularGraph extends StatelessWidget {
  CircularGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 196,
          width: 196,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
              boxShadow: [
                BoxShadow(color: Colors.grey, spreadRadius: 2, blurRadius: 2)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Icon(Icons.bolt_rounded, color: CustomColors.kYellow, size: 50),
              Text("617",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600)),
              Text("REMAINING",
                  style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
        RepaintBoundary(
          child: PieChart(
            dataMap: dataMap,
            animationDuration: const Duration(milliseconds: 800),
            chartRadius: 230,
            initialAngleInDegree: 270,
            baseChartColor: Colors.transparent,
            totalValue: 100,
            chartType: ChartType.ring,
            ringStrokeWidth: 20,
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

  final dataMap = <String, double>{
    "Completed": 62,
  };

  final colorList = <Color>[
    CustomColors.kOrange,
    CustomColors.kYellow,
  ];
}
