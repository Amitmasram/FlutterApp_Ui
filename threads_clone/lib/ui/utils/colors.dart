import 'package:flutter/material.dart';

class AppsColor {
  // static const int _primary01 = 0xFF013E81;
  // MaterialColor primary01 = MaterialColor(_primary01, {
  //   50: Colors.blue[50]!,
  //   100: const Color(0xFFC7E8F9),
  //   200: const Color(0xFF92CEF2),
  //   300: const Color(0xFF56A1D8),
  //   400: const Color(0xFF2D72B3),
  //   500: const Color(_primary01),
  //   600: const Color(0xFF002F6D),
  //   700: const Color(0xFF00235B),
  //   800: const Color(0xFF01184A),
  //   900: const Color(0xFF00113D),
  // });

  static const int _success = 0xFF1B8718;
  MaterialColor sucess = const MaterialColor(_success, {
    100: Color(0xFFDEF9D0),
    200: Color(0xFFBAF3A4),
    300: Color(0xFF83DB6D),
    400: Color(0xFF51B747),
    500: Color(_success),
    600: Color(0xFF117419),
    700: Color(0xFF0B6118),
    800: Color(0xFF084E18),
    900: Color(0xFF044118),
  });

  static const int _warning = 0xFFB18500;
  MaterialColor warning = const MaterialColor(_warning, {
    100: Color(0xFFFAF3C7),
    200: Color(0xFFF7E694),
    300: Color(0xFFE7CC5B),
    400: Color(0xFFD0AD35),
    500: Color(_warning),
    600: Color(0xFF986E00),
    700: Color(0xFF815901),
    800: Color(0xFF674400),
    900: Color(0xFF553600),
  });

  static const int _error = 0xFFF40000;
  MaterialColor error = const MaterialColor(_error, {
    100: Color(0xFFFEDDCB),
    200: Color(0xFFFDB298),
    300: Color(0xFFFB7E64),
    400: Color(0xFFF84E3E),
    500: Color(_error),
    600: Color(0xFFD10012),
    700: Color(0xFFAF001E),
    800: Color(0xFF8D0024),
    900: Color(0xFF750028),
  });

  static const int _white = 0xFFFFFFFF;
  MaterialColor white = const MaterialColor(
    _white,
    {
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );

  static const int _grey = 0xFF999999;
  MaterialColor grey = const MaterialColor(_grey, {
    100: Color(0xFFFFFFFF),
    500: Color(_grey),
  });

  static const int _neutral = 0xFFBDBDBD;
  static List<Color> neutralColor = const [
    Color(0xFFFFFFFF),
    Color(0xFFFAFAFA),
    Color(0xFFF2F2F2),
    Color(0xFFE0E0E0),
    Color(_neutral),
    Color(0xFF828282),
    Color(0xFF4A4A4A),
    Color(0xFF333333),
    Color(0xFF000000),
  ];

  void reverseNeutralColor() {
    neutralColor = neutralColor.reversed.toList();
    neutral = MaterialColor(_neutral, {
      100: neutralColor[0],
      200: neutralColor[1],
      300: neutralColor[2],
      400: neutralColor[3],
      500: neutralColor[4],
      600: neutralColor[5],
      700: neutralColor[6],
      800: neutralColor[7],
      900: neutralColor[8],
    });
  }

  MaterialColor neutral = MaterialColor(_neutral, {
    100: neutralColor[0],
    200: neutralColor[1],
    300: neutralColor[2],
    400: neutralColor[3],
    500: neutralColor[4],
    600: neutralColor[5],
    700: neutralColor[6],
    800: neutralColor[7],
    900: neutralColor[8],
  });
}
