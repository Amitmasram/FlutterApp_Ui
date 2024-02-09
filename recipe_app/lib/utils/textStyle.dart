// ignore_for_file: file_names

import 'package:bloc_practice/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
/* MyText class which can contain diffrent type of text styling.
    also provide some ease.*/
class MyText {
  static heading(
      {required String text,
      Color? color = whiteColor,
      TextAlign? textAlign = TextAlign.center}) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
    )
     /*.animate is GSkinner made animation which makes the animation alot eaiser 
     package name: flutter_animate*/ 
        .animate(delay: 1.3.seconds)
        .then(duration: 500.ms)
        .fadeIn(begin: 0, duration: 300.ms)
        .moveY(begin: -50);
  }

  static body({required String text, Color? color = secondaryColor, FontWeight? fontWeight = FontWeight.normal}) {
    return Text(
      text,
      style:
          TextStyle(fontSize: 14, fontWeight: fontWeight, color: color),
    ).animate(delay: 1.3.seconds)
        .then(duration: 500.ms)
        .fadeIn(begin: 0, duration: 300.ms)
        .moveY(begin: -50);
  }

  static step({required String heading, required String text}){
    return RichText(text: TextSpan(children: [
      TextSpan(text: heading,style:
          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: blackColor),),
      TextSpan(text: text,style: const
          TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: blackColor),),
    ])).animate(delay: 1.3.seconds)
        .then(duration: 500.ms)
        .fadeIn(begin: 0, duration: 300.ms)
        .moveY(begin: -50);
  }
}
