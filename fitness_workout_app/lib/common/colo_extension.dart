import 'package:flutter/material.dart';

class TColor {
  static Color get primaryColor1 => Color.fromARGB(255, 63, 91, 234);
  static Color get primaryColor2 => Color.fromARGB(255, 114, 174, 234);

  static Color get secondaryColor1 => Color.fromARGB(255, 187, 126, 234);
  static Color get secondaryColor2 => const Color(0xffEEA4CE);

  static List<Color> get primaryG => [primaryColor2, primaryColor1];
  static List<Color> get secondaryG => [secondaryColor2, secondaryColor1];

  static Color get black => const Color(0xff1D1617);
  static Color get gray => const Color(0xff786F72);
  static Color get white => Colors.white;
  static Color get lightGray => const Color(0xffF7F8F8);
}
