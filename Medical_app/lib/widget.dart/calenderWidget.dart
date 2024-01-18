import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget(
      {super.key,
      required this.value,
      required this.data,
      required this.index});

  final int value;
  final List<Map<String, dynamic>> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: value == index ? Colors.blue[900] : Colors.blue[100]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data[index]['date'],
            style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: value == index ? Colors.white : Colors.black),
          ),
          Text(
            data[index]['day'],
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: value == index ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}
