import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:jewelry_app/app/data/data.dart';

import 'components/banner_card.dart';
import 'components/body.dart';
import 'components/header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.primary,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Padding(
              padding: EdgeInsets.all(10.r),
              child: SvgPicture.asset(CustomAssets.kMenu,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(CustomAssets.kSearch,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: Stack(
        children: [
          //Body ListView
           Positioned.fill(top: 280.h, child: BodyComponent()),
           
           //Header
           Positioned(top: 0, child: HeaderCard()),
           
           //Banner
           Positioned(
            top: 230,
            right: 24,
            left: 24,
             child: BannerCard()
           )
         
        ],
      ),
    );
  }
}
