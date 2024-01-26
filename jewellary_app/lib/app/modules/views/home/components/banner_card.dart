import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/data.dart';


class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 130.h,
              width: 200.w,
              padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 15.h),
              decoration: BoxDecoration(
                color: CustomColors.secondary,
                borderRadius: BorderRadius.circular(15.r)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Your Renting\nHistory',style: CustomTextStyles.kBold20.copyWith(color: Colors.white)),

                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.09),
                          shape: BoxShape.circle
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SvgPicture.asset(CustomAssets.kArrowForward,color: Colors.white,height: 50.h),
                      )
                    ],
                  )
                ],
              ),
             );
  }
}