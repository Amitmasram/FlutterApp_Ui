import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditation_app/model/picks_model.dart';

class PicksCard extends StatelessWidget {
  final Picks picks;
  const PicksCard({super.key, required this.picks});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 140,
          width: 220,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: AssetImage(picks.image), fit: BoxFit.cover)),
        ),
        const SizedBox(height: 5),
        Text(
          picks.title,
          style: GoogleFonts.poppins(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        Text(
          picks.subTitle,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
