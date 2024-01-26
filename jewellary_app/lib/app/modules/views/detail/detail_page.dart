import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jewelry_app/app/data/data.dart';
import 'package:jewelry_app/app/models/jewelry_model.dart';
import 'package:rubber/rubber.dart';
import 'components/custom_text_icons.dart';
import 'components/detailed_sheet.dart';

class DetailPageView extends StatefulWidget {
  final Jewelry jewelry;
  const DetailPageView({super.key, required this.jewelry});

  @override
  State<DetailPageView> createState() => _DetailPageViewState();
}

class _DetailPageViewState extends State<DetailPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person_2_outlined,
                color: Colors.black,
              ))
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          //Ring Text
          Positioned(
            top: -20,
            right: -20,
            left: -20,
            child: Text('RING',
                style: GoogleFonts.londrinaOutline(
                    fontSize: 250.sp,
                    letterSpacing: 12,
                    color: CustomColors.grey,
                    fontWeight: FontWeight.w600)),
          ),

          //Jewelry Name
          Positioned(
            top: 30,
            child: Container(
              child: Text(
                widget.jewelry.jewelryType,
                style: CustomTextStyles.kBold20,
                textAlign: TextAlign.center,
              ),
            ),
          ),

          //Sheet
          Positioned.fill(
            bottom: 0,
            top: 220,
            right: 0,
            left: 0,
            child: Container(
              height: 10,
              width: 10,
              padding: EdgeInsets.only(top: 170.h, right: 24.w, left: 24.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(300.r),
                    topRight: Radius.circular(300.r)),
                color: CustomColors.grey,
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(widget.jewelry.jewelryType,
                        style: CustomTextStyles.kBold24
                            .copyWith(color: Colors.black)),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomTextIcons(
                        icon: CustomAssets.kFourSideDiamond,
                        text: '18k',
                      ),
                      CustomTextIcons(
                        icon: CustomAssets.kBlocks,
                        text: '18k',
                      ),
                      CustomTextIcons(
                        icon: CustomAssets.kMeasure,
                        text: '18k',
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Container(
                        height: 60.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            image: DecorationImage(
                                image: AssetImage('assets/flower.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Container(
                          height: 60.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              image: DecorationImage(
                                  image: AssetImage('assets/flower.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${widget.jewelry.pricePerHour}\$/h",
                          style: CustomTextStyles.kBold24),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(100.w, 60.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r),
                                topRight: Radius.circular(20.r),
                              ))),
                          child: Text("Rent"))
                    ],
                  )
                ],
              ),
            ),
          ),

          //Image
          Positioned(
              top: 100,
              child: Container(
                  // color: Colors.red,
                  child: Image.asset(
                widget.jewelry.image,
                height: 300.h,
                width: 300.w,
                fit: BoxFit.cover,
              )))
        ],
      ),
    );
  }
}
