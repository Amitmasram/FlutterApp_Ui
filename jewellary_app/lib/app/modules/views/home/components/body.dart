import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jewelry_app/app/modules/views/detail/detail_page.dart';

import '../../../../data/data.dart';
import '../../../../models/jewelry_model.dart';
import '../../../widgets/jewelry_card.dart';
import '../../../widgets/menu_card.dart';


class BodyComponent extends StatelessWidget {
  const BodyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 140.h),
                child: ListView(
                  
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: MenuCard(
                          icon: CustomAssets.kDiamond,
                          text: 'Jewelry',
                          onTap: () {},
                          isSelected: true,
                        )),
                        SizedBox(width: 10.w),
                        Expanded(
                            child: MenuCard(
                          icon: CustomAssets.kClothing,
                          text: 'Clothing',
                          onTap: () {},
                        ))
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Text("Ready to Rent", style: CustomTextStyles.kBold20),
                    SizedBox(height: 10.h),
                    ListView.separated(
                      separatorBuilder: (context,index)=>SizedBox(height: 10.h),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: jewelryList.length,
                      itemBuilder: (context,index){
                        return JewelryCard(
                          onTap: (){
                            Get.to(()=>DetailPageView(
                              jewelry: jewelryList[index],
                            ));
                          },
                          jewelry: jewelryList[index],
                        );
                      })
                  ],
                ),
              );
  }
}