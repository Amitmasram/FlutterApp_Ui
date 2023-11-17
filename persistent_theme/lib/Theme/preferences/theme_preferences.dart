import 'package:flutter/material.dart';

// Utility class to hold theme preference names
class ThemePref {
  static const String lightTheme = "LightTheme";
  static const String darkTheme = "DarkTheme";
  static const String deepOrangeThemeLight = "DeepOrangeThemeLight";
  static const String deepPurpleThemeLight = "DeepPurpleThemeLight";

  // List of available theme preferences
  static List<String> themePrefList = [
    "LightTheme",
    "DarkTheme",
    "DeepOrangeThemeLight",
    "DeepPurpleThemeLight",
  ];
}

// Map to store ThemeData for different themes
final appThemeData = {
  ThemePref.lightTheme: ThemeData(
    brightness: Brightness.light,
  ),
  ThemePref.darkTheme: ThemeData(
    brightness:
        Brightness.dark, // This should typically be dark for a dark theme
  ),
  ThemePref.deepOrangeThemeLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.deepOrange,
    primarySwatch: Colors.deepOrange,
  ),
  ThemePref.deepPurpleThemeLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.deepPurple,
    primarySwatch: Colors.deepPurple,
  ),
};
