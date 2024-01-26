import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/data.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
            height: 280,
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: CustomColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.r),
                bottomRight: Radius.circular(40.r)
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text('Hello, Shameel',style: CustomTextStyles.kMedium16.copyWith(color: Colors.white)),
                Text('Luxury',style: CustomTextStyles.kBold65.copyWith(color: Colors.white)),
                Text('Manager',style: CustomTextStyles.kMedium60.copyWith(color: Colors.white))
              ],
            ),
          );
  }
}