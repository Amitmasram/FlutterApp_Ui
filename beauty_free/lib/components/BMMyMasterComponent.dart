import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/BMMasterModel.dart';
import '../screens/BMCalenderScreen.dart';
import '../utils/BMColors.dart';
import '../utils/BMDataGenerator.dart';

class BMMyMasterComponent extends StatelessWidget {
  List<BMMasterModel> myMasterList = getMyMastersList();

  @override
  Widget build(BuildContext context) {
    return HorizontalList(
        padding: EdgeInsets.symmetric(horizontal: 16),
        spacing: 16,
        itemCount: myMasterList.length,
        itemBuilder: (context, index) {
          return Container(
              height: 190,
              width: 200,
              child: Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 60,
                      child: Container(
                        width: 200,
                        padding: EdgeInsets.only(top: 50, bottom: 30),
                        decoration: BoxDecoration(borderRadius: radius(32), color: context.cardColor),
                        child: Text(myMasterList[index].name, style: boldTextStyle(), textAlign: TextAlign.center),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: Image.asset(myMasterList[index].image, height: 100, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
                    ),
                    Positioned(
                      bottom: 0,
                      child: AppButton(
                        shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                        child: Text('Book Now', style: boldTextStyle(color: Colors.white)),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        color: bmPrimaryColor,
                        onTap: () {
                          BMCalenderScreen(isStaffBooking: true).launch(context);
                        },
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}
