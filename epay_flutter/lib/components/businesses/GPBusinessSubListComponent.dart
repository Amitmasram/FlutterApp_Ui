import 'package:epay_flutter/model/GPModel.dart';
import 'package:epay_flutter/utils/GPColors.dart';
import 'package:epay_flutter/utils/GPDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GPBusinessSubListComponent extends StatefulWidget {
  static String tag = '/GPBusinessSubListComponent';

  @override
  GPBusinessSubListComponentState createState() => GPBusinessSubListComponentState();
}

class GPBusinessSubListComponentState extends State<GPBusinessSubListComponent> {
  List<GPBusinessSublistModel> getBusinessTravelModel = getBusinessTravelList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey[300]!), borderRadius: BorderRadius.all(Radius.circular(15))),
      child: ListView.builder(
        padding: EdgeInsets.all(20),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: getBusinessTravelModel.length,
        itemBuilder: (context, index) {
          GPBusinessSublistModel mData = getBusinessTravelModel[index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(radius: 22, backgroundColor: black, backgroundImage: AssetImage(mData.image)),
              10.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(mData.name, style: primaryTextStyle(size: 14, color: GPColorBlack)),
                  Text(mData.description, style: secondaryTextStyle(size: 13, color: GPColorBlack)),
                ],
              ).expand(),
              Text(mData.buttonTitle, style: primaryTextStyle(color: GPAppColor, size: 14, weight: FontWeight.bold))
            ],
          ).paddingOnly(top: 12, bottom: 12);
        },
      ),
    ).paddingOnly(top: 10, left: 16, right: 16);
  }
}
