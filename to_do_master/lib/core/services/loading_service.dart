import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../theme/application_theme.dart';

void configLoading(){

  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..maskType = EasyLoadingMaskType.black
    ..backgroundColor = Colors.white
    ..textColor = Colors.white
    ..indicatorColor = ApplicationTheme.primaryColor
    ..userInteractions = false
    ..dismissOnTap = false;

}
