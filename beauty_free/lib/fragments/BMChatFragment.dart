import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../models/BMMessageModel.dart';
import '../screens/BMChatScreen.dart';
import '../utils/BMColors.dart';
import '../utils/BMDataGenerator.dart';
import '../utils/BMWidgets.dart';

class BMChatFragment extends StatefulWidget {
  @override
  State<BMChatFragment> createState() => _BMChatFragmentState();
}

class _BMChatFragmentState extends State<BMChatFragment> {
  @override
  void initState() {
    setStatusBarColor(appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor);
    super.initState();
  }

  List<BMMessageModel> personList = getMessageList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          30.height,
          titleText(title: 'Messages').paddingAll(16),
          20.height,
          HorizontalList(
            spacing: 4,
            itemCount: personList.length,
            itemBuilder: (context, index) {
              if (personList[index].isActive.validate()) {
                return SizedBox(
                  width: 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Image.asset(personList[index].image, height: 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
                          Positioned(bottom: 0, right: 0, child: Icon(Icons.circle, size: 12, color: Colors.lightBlueAccent))
                        ],
                      ),
                      4.height,
                      Text(personList[index].name, style: secondaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : bmSpecialColorDark), textAlign: TextAlign.center)
                    ],
                  ).onTap(() {
                    BMChatScreen(element: personList[index]).launch(context);
                  }),
                );
              } else {
                return Offstage();
              }
            },
          ),
          16.height,
          Container(
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(color: appStore.isDarkModeOn ? bmSecondBackgroundColorDark : bmSecondBackgroundColorLight, borderRadius: radiusOnly(topRight: 32, topLeft: 32)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: personList.map((e) {
                return Row(
                  children: [
                    Image.asset(e.image, height: 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
                    8.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [titleText(title: e.name, size: 14), Text(e.message!, style: secondaryTextStyle(color: appStore.isDarkModeOn ? bmTextColorDarkMode : bmPrimaryColor, size: 12))],
                    )
                  ],
                ).onTap(() {
                  BMChatScreen(element: e).launch(context);
                }).paddingSymmetric(vertical: 8, horizontal: 16);
              }).toList(),
            ),
          ).flexible(flex: 1)
        ],
      ),
    );
  }
}
