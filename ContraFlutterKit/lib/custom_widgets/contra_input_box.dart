import 'package:contraflutterkit/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContraInputBox extends StatelessWidget {
  final String hintText;
  final String iconPath;
  final bool showPrefix;

  const ContraInputBox(
      {required this.hintText,
      required this.iconPath,
      required this.showPrefix});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 21, fontWeight: FontWeight.w500, color: wood_smoke),
            contentPadding: EdgeInsets.all(16),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: black),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: black),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: black),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: black),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            prefixIcon: showPrefix
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      iconPath,
                      height: 24,
                      width: 24,
                    ),
                  )
                : null),
      ),
    );
  }
}
