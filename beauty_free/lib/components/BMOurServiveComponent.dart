import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/BMServiceListModel.dart';
import '../utils/BMColors.dart';
import '../utils/BMDataGenerator.dart';
import '../utils/BMWidgets.dart';
import 'BMServiceComponent.dart';

class BMOurServiveComponent extends StatelessWidget {
  List<BMServiceListModel> popularServiceList = getPopularServiceList();
  List<BMServiceListModel> otherServiceList = getOtherServiceList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.height,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: bmPrimaryColor.withAlpha(50),
            borderRadius: radius(32),
            border: Border.all(color: bmPrimaryColor),
          ),
          child: AppTextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search_sharp, color: bmPrimaryColor),
              hintText: 'Search for Services',
              hintStyle: secondaryTextStyle(color: bmPrimaryColor),
            ),
            textFieldType: TextFieldType.NAME,
            cursorColor: bmPrimaryColor,
          ),
        ),
        16.height,
        titleText(title: 'Popular Services'),
        16.height,
        Column(
          mainAxisSize: MainAxisSize.min,
          children: popularServiceList.map((e) {
            return BMServiceComponent(element: e);
          }).toList(),
        ),
        16.height,
        titleText(title: 'Other Services'),
        16.height,
        Column(
          mainAxisSize: MainAxisSize.min,
          children: otherServiceList.map((e) {
            return BMServiceComponent(element: e);
          }).toList(),
        ),
        30.height,
      ],
    ).paddingSymmetric(horizontal: 16);
  }
}
