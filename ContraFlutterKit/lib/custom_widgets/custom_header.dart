import 'package:contraflutterkit/login/contra_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  String lineOneText;
  String lineTwotext;
  Color fg_color;
  Color bg_color;
  Color color;
  bool isTwoLines;

  CustomHeader(
      {required this.lineOneText,
      required this.lineTwotext,
      required this.color,
      this.isTwoLines = true,
      required this.fg_color,
      required this.bg_color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: isTwoLines
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Text(
                      lineOneText,
                      style: TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.w800,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = fg_color,
                      ),
                    ),
                    // Solid text as fill.
                    Text(
                      lineOneText,
                      style: TextStyle(
                          fontSize: 44,
                          color: bg_color,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                ContraText(
                  text: lineTwotext,
                  alignment: Alignment.centerLeft,
                  size: 44,
                  color: color,
                )
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Text(
                      lineOneText,
                      style: TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.w800,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = fg_color,
                      ),
                    ),
                    // Solid text as fill.
                    Text(
                      lineOneText,
                      style: TextStyle(
                          fontSize: 44,
                          color: bg_color,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                ContraText(
                  text: lineTwotext,
                  alignment: Alignment.centerLeft,
                  size: 44,
                  color: color,
                )
              ],
            ),
    );
  }
}
