import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(25)),
                  child: TextField(
                    cursorColor: Colors.white,
                    controller: TextEditingController(),
                    textAlignVertical: TextAlignVertical.top,
                    style:
                        GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.grey),
                        hintText: "Start Your Search Now",
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15)),
                  ),
                );
  }
}