import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/BMAppointMentTabComponent.dart';
import '../main.dart';
import '../utils/BMColors.dart';
import '../utils/BMWidgets.dart';

class BMAppointmentFragment extends StatefulWidget {
  const BMAppointmentFragment({Key? key}) : super(key: key);

  @override
  State<BMAppointmentFragment> createState() => _BMAppointmentFragmentState();
}

class _BMAppointmentFragmentState extends State<BMAppointmentFragment> {
  List<String> tabList = ['UPCOMING', 'PAST'];
  int selectedTab = 0;

  @override
  void initState() {
    setStatusBarColor(appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor);
    super.initState();
  }

  @override
  void dispose() {
    setStatusBarColor(Colors.transparent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
        elevation: 0,
        leading: SizedBox(),
        leadingWidth: 16,
        title: titleText(title: 'Appointments'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(color: appStore.isDarkModeOn ? bmSecondBackgroundColorDark : bmSecondBackgroundColorLight, borderRadius: radiusOnly(topLeft: 32, topRight: 32)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: tabList.map((e) {
                  int index = tabList.indexOf(e);
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: radius(32),
                      color: selectedTab == index ? bmPrimaryColor : Colors.transparent,
                    ),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      tabList[index],
                      style: boldTextStyle(
                        size: 14,
                        color: selectedTab == index
                            ? white
                            : appStore.isDarkModeOn
                                ? bmPrimaryColor
                                : bmSpecialColorDark,
                      ),
                    ).onTap(() {
                      selectedTab = index;
                      setState(() {});
                    }),
                  );
                }).toList(),
              ).center(),
              20.height,
              BMAppointMentTabComponent(tabOne: selectedTab == 0 ? true : false),
              20.height,
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
