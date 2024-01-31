import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInfoColumns extends StatelessWidget {
  final String title;
  final String numbersOfIngredients;
  const CustomInfoColumns(
      {super.key, required this.title, required this.numbersOfIngredients});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(numbersOfIngredients,
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600)),
        Text(title,
            style: GoogleFonts.padauk(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}
