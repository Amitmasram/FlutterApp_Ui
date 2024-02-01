import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../utils/BMColors.dart';
import 'BMEnableNotificationScreen.dart';

class BMEnableLocationScreen extends StatefulWidget {
  const BMEnableLocationScreen({Key? key}) : super(key: key);

  @override
  State<BMEnableLocationScreen> createState() => _BMEnableLocationScreenState();
}

class _BMEnableLocationScreenState extends State<BMEnableLocationScreen> {
  @override
  void initState() {
    setStatusBarColor(appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor);
    super.initState();
  }

  @override
  void dispose() {
    setStatusBarColor(bmSpecialColor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          20.height,
          Column(
            children: [
              Image.asset('images/map.png', height: 200),
              Text('In order to use Beauty Master location services must be enabled',
                  style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : bmSpecialColorDark), textAlign: TextAlign.center),
              16.height,
              Text(
                'Accessing your location will allow you to find places near you, and provides the ability to use Beauty Master to book services.',
                style: secondaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : bmSpecialColorDark),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: [
              AppButton(
                width: context.width() - 40,
                shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                child: Text('Enable Location', style: boldTextStyle(color: Colors.white)),
                padding: EdgeInsets.all(16),
                color: bmPrimaryColor,
                onTap: () {
                  BMEnableNotificationScreen().launch(context);
                },
              ),
              20.height,
              Text('Maybe Later', style: boldTextStyle(color: appStore.isDarkModeOn ? bmPrimaryColor : Colors.grey)),
            ],
          )
        ],
      ).paddingAll(20),
    );
  }
}
