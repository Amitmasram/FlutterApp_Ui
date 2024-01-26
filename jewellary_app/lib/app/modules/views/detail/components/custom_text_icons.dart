import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/data.dart';

class CustomTextIcons extends StatelessWidget {
  final String icon;
  final String text;
  const CustomTextIcons({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(icon,height: 30.h,),
        SizedBox(height: 5.h),
        Text(text,style: CustomTextStyles.kBold14)
      ],
    );
  }
}