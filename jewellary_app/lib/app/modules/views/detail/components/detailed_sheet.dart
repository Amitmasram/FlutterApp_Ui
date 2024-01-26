import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jewelry_app/app/data/constants.dart';
import 'package:jewelry_app/app/models/jewelry_model.dart';
import 'package:rubber/rubber.dart';

class DetailedSheet extends StatefulWidget {
  final Jewelry jewelry;
  final ScrollController rubberSheetScrollController;
  final RubberAnimationController rubberSheetAnimationController;
  const DetailedSheet(
      {super.key,
      required this.jewelry,
      required this.rubberSheetScrollController,
      required this.rubberSheetAnimationController});

  @override
  State<DetailedSheet> createState() => _DetailedSheetState();
}

class _DetailedSheetState extends State<DetailedSheet> {
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 600),
      tween: Tween<double>(begin: size.height/2, end: 0),
      builder: (_, value, child) {
        return Transform.translate(
          offset: Offset(0, value),
          child: child,
        );
      },
      child: RubberBottomSheet(
       
        scrollController: widget.rubberSheetScrollController,
        animationController: widget.rubberSheetAnimationController,
        lowerLayer: Container(
       color:  Colors.transparent
        ),
        upperLayer: Container(
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Container(
                   
                    decoration: BoxDecoration(
                      color: Colors.red,
                      // image: DecorationImage(image: AssetImage(widget.jewelry.image),fit: BoxFit.cover)
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
