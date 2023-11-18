import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var accent = const Color(0xFFACFD3E);
var accentDark = const Color(0xFF347706);
var accentText = const Color(0xFF002700);

var bgDark = const Color(0xFF0C1013);
var bgMed = const Color(0xFF1C1D22);
var bgLight = const Color(0xFF29313C);
var bgIcon = const Color(0xFF364445);

var text = const Color(0xFFFEFFFF);
var textDark = const Color(0xFF666666);

TextStyle p1Light =
    GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w500, color: text);
TextStyle p1Dark = GoogleFonts.poppins(
    fontSize: 10, fontWeight: FontWeight.w500, color: textDark);
TextStyle p2 = GoogleFonts.poppins(
    fontSize: 12, fontWeight: FontWeight.w500, color: accent);
TextStyle p3 = GoogleFonts.poppins(
    fontSize: 13, fontWeight: FontWeight.w500, color: textDark);
TextStyle p4 = GoogleFonts.poppins(
    fontSize: 14, fontWeight: FontWeight.w500, color: accentText);
TextStyle p5 =
    GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500, color: text);
TextStyle p6 = GoogleFonts.poppins(
    fontSize: 19, fontWeight: FontWeight.bold, color: accentText);

TextStyle h4 = GoogleFonts.poppins(
    fontSize: 16, fontWeight: FontWeight.bold, color: textDark);
TextStyle h3 = GoogleFonts.poppins(
    fontSize: 35, fontWeight: FontWeight.w600, color: accent);

TextStyle h1 =
    GoogleFonts.poppins(fontSize: 35, fontWeight: FontWeight.w500, color: text);
TextStyle h2 =
    GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: text);
