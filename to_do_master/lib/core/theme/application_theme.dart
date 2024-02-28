import 'package:flutter/material.dart';

class ApplicationTheme {
  static Color primaryColor = const Color(0xff5D9CEC);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      background: const Color(0xffDFECDB),
      secondary: const Color(0xffffffff),
      onPrimary: primaryColor,
      onSecondary: const Color(0xff000000),
    ),
    scaffoldBackgroundColor: const Color(0xffDFECDB),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      centerTitle: false,
      toolbarHeight: 150,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedIconTheme: IconThemeData(
        color: primaryColor,
      ),
      selectedItemColor: primaryColor,
      unselectedIconTheme: IconThemeData(
        color: Colors.grey.shade700,
      ),
      unselectedItemColor: Colors.grey.shade700,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    textTheme: TextTheme(
      titleLarge: const TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: primaryColor,
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: const TextStyle(
        color: Colors.black,
        fontFamily: 'Poppins',
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: const TextStyle(
        color: Colors.black,
        fontFamily: 'Poppins',
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      showDragHandle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,

    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xff5D9CEC),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff5D9CEC),
      primary: const Color(0xff5D9CEC),
      background: const Color(0xff060E1E),
      secondary: const Color(0xff141922),
      onPrimary: const Color(0xffffffff),
      onSecondary: const Color(0xffffffff),
    ),
    scaffoldBackgroundColor: const Color(0xff060E1E),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff5D9CEC),
      elevation: 0,
      centerTitle: false,
      toolbarHeight: 150,
      titleTextStyle: TextStyle(
        color: Color(0xff060E1E),
        fontFamily: 'Poppins',
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedIconTheme: IconThemeData(
        color: primaryColor,
      ),
      selectedItemColor: primaryColor,
      unselectedIconTheme: IconThemeData(
        color: Colors.grey.shade700,
      ),
      unselectedItemColor: Colors.grey.shade700,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    textTheme: TextTheme(
      titleLarge: const TextStyle(
        color: Color(0xff060E1E),
        fontFamily: 'Poppins',
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: primaryColor,
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: const TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: const TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color(0xff141922),
      showDragHandle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
  );
}
