// ignore_for_file: file_names

import 'package:flutter/material.dart';
/* A Navigation class for own easiness don't have to write the whole code again and again */
class Navigation {
  static to(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }

  static pop(BuildContext context){
    Navigator.of(context).pop();
  }
  
  static replace(BuildContext context, Widget newScreen) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => newScreen,
    ));
  }
}
