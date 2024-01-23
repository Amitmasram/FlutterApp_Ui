import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppsTheme {
  static ThemeData theme = ThemeData(
    primarySwatch: AppsTheme.color.white,
    textTheme: GoogleFonts.openSansTextTheme(),
    scaffoldBackgroundColor: AppsTheme.color.neutral.shade100,
  );
  static AppsColor color = AppsColor();
}
