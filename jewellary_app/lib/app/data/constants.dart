import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomColors {
  static const Color primary = const Color(0xff3A5769);
  static const Color white = const Color(0xffFFFFFF);
  static const Color grey = const Color(0xffF2EFEE);
  static const Color secondary = const Color(0xffC59A78);
}

//Status Bar & System Nav Bar
SystemUiOverlayStyle defaultOverlay = const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarColor: Colors.white);
