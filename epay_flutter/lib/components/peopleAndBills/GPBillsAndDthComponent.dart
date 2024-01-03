import 'package:epay_flutter/components/peopleAndBills/GPDthDetailsComponent.dart';
import 'package:epay_flutter/model/GPModel.dart';
import 'package:epay_flutter/utils/GPColors.dart';
import 'package:epay_flutter/utils/GPDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class BillsAndDthComponent extends StatefulWidget {
  static String tag = '/BillsAndDthComponent';

  @override
  BillsAndDthComponentState createState() => BillsAndDthComponentState();
}

class BillsAndDthComponentState extends State<BillsAndDthComponent> {
  late List<GPDthModel> getDthList;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    getDthList = getDthData();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(left: 8, right: 8, top: 10),
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey[400],
        );
      },
      scrollDirection: Axis.vertical,
      itemCount: getDthList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        GPDthModel mData = getDthList[index];
        return GestureDetector(
          onTap: () {
            DthDetailsComponent(titleData: mData.dthName, index: index).launch(context);
          },
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: GPAppColor,
                    radius: 22,
                    child: Image.asset(mData.dthImg, height: 25, width: 25, color: backgroundColor),
                  ),
                  10.width,
                  Text(mData.dthName, style: secondaryTextStyle(size: 14, color: GPColorBlack)),
                ],
              ).onTap(() {
                DthDetailsComponent(titleData: mData.dthName, index: index).launch(context);
              }),
            ],
          ),
        ).paddingOnly(left: 8, right: 8);
      },
    );
  }
}
