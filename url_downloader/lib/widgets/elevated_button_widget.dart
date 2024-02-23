import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget(
      {super.key, required this.callbackFunction, required this.text});
  final Function()? callbackFunction;
  final String text;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: callbackFunction,
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          backgroundColor: MaterialStatePropertyAll(
            ColorsTheme.orangeColor,
          )),
      child: Container(
        alignment: Alignment.center,
        height: size.height * 0.065,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.05,
          ),
        ),
      ),
    );
  }
}
