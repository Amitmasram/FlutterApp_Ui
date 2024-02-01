import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/BMCommonCardModel.dart';
import '../utils/BMColors.dart';

class BMSingleImageScreen extends StatefulWidget {
  BMCommonCardModel element;

  BMSingleImageScreen({required this.element});

  @override
  _BMSingleImageScreenState createState() => _BMSingleImageScreenState();
}

class _BMSingleImageScreenState extends State<BMSingleImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.height(),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(widget.element.image), fit: BoxFit.cover),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Image.asset('images/x.png', height: 16, fit: BoxFit.cover, color: bmPrimaryColor),
              decoration: BoxDecoration(
                borderRadius: radius(100),
                color: context.cardColor,
              ),
              padding: EdgeInsets.all(12),
            ).onTap(() {
              finish(context);
            }),
            Container(
              child: widget.element.liked! ? Icon(Icons.favorite, color: bmPrimaryColor) : Icon(Icons.favorite_outline, color: bmPrimaryColor),
              decoration: BoxDecoration(
                borderRadius: radius(100),
                color: context.cardColor,
              ),
              padding: EdgeInsets.all(8),
            ).onTap(() {
              widget.element.liked = !widget.element.liked!;
              setState(() {});
            }, borderRadius: radius(100)),
          ],
        ),
      ),
    );
  }
}
