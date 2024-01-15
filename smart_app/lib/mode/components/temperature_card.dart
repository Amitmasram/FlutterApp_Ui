import 'package:flutter/material.dart';
import 'package:smart_app/data/constants.dart';

class TemperatureCard extends StatelessWidget {
  final String heading;
  final String temperature;
  final Color color;
  const TemperatureCard(
      {super.key,
      required this.heading,
      required this.temperature,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: CustomColor.kNavyBlue,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(heading,
                  style: const TextStyle(color: Colors.white, fontSize: 10)),
              const SizedBox(width: 5),
              Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              )
            ],
          ),
          Text(
            temperature,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30),
          ),
        ],
      ),
    );
  }
}
