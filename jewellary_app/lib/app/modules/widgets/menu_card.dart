import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/data.dart';

class MenuCard extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback? onTap;
  final  bool isSelected;
  const MenuCard({super.key, required this.icon, required this.text, this.onTap,this.isSelected=false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 150.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: CustomColors.grey, borderRadius: BorderRadius.circular(20.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon,height: 30.h,width: 30.w,color: isSelected?Colors.orange:Colors.black),
            SizedBox(height: 5.h),
            Text(
              text,
              style: CustomTextStyles.kMedium16,
            )
          ],
        ),
      ),
    );
  }
}
