import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  // App Images ..
  static const String profile = "assets/images/profile.jpg";
  static const String image1 = "assets/images/doctor.png";

  /// App Icons.

  static const String filtterIcon = "assets/icons/adjust-horizontal-alt.svg";
  static const String searchIcon = "assets/icons/search.svg";
  static const String notifications = 'assets/images/notification.png';
  static const String heartBeat = 'assets/images/heartBeat.png';
  static const String blood = 'assets/icons/blood.png';
  static const String weight = 'assets/icons/weight.png';
  // Bottom Bar icons

  static const String homeIcon = "assets/icons/home.svg";
  static const String eventIcon = "assets/icons/event_note.svg";
  static const String reportIcon = "assets/icons/report.svg";
  static const String notificationsIcon = "assets/icons/notifications.svg";

// App Colors
  static const primarySwatch = Color(0xff1C6BA4);
  static const inputFillColor = Color(0xffEEF6FC);
//Dr images
  static const doctor1 = 'assets/images/d1.jpeg';
  static const doctor2 = 'assets/images/d2.jpeg';
  static const doctor3 = 'assets/images/d3.jpeg';
  // App Theme Data..

  static ThemeData? theme = ThemeData(
    textTheme: GoogleFonts.nunitoSansTextTheme().apply(
      bodyColor: const Color(0xff0E1012),
      displayColor: const Color(0xff0E1012),
    ),
  );
}
