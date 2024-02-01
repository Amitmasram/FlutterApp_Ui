import 'package:beauty_master/components/BMCommentComponent.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../models/BMCommentModel.dart';
import '../models/BMMasterModel.dart';
import '../models/BMServiceListModel.dart';
import '../screens/BMCalenderScreen.dart';
import '../screens/BMCallScreen.dart';
import 'BMColors.dart';
import 'BMDataGenerator.dart';
import 'BMWidgets.dart';

void showFilterBottomSheet(BuildContext context) {
  double value = 5.0;

  bool distChecked = false;
  bool topChecked = false;
  bool specialChecked = false;
  bool mobileChecked = false;
  bool onlineChecked = false;

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
      builder: (context) {
        return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    finish(context);
                  },
                  icon: Icon(Icons.cancel_rounded, color: bmTextColorDarkMode),
                ),
              ),
              titleText(title: 'Filters', size: 24),
              16.height,
              Text('Sort by', style: boldTextStyle(color: appStore.isDarkModeOn ? white : bmSpecialColorDark)),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Distance', style: primaryTextStyle(color: appStore.isDarkModeOn ? white : bmSpecialColorDark)),
                  IconButton(
                    icon: distChecked ? Icon(Icons.check_circle, color: bmPrimaryColor) : Icon(Icons.circle_outlined, color: bmPrimaryColor),
                    onPressed: () {
                      distChecked = !distChecked;
                      setState(() {});
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Top Reviewed', style: primaryTextStyle(color: appStore.isDarkModeOn ? white : bmSpecialColorDark)),
                  IconButton(
                    icon: topChecked ? Icon(Icons.check_circle, color: bmPrimaryColor) : Icon(Icons.circle_outlined, color: bmPrimaryColor),
                    onPressed: () {
                      topChecked = !topChecked;
                      setState(() {});
                    },
                  ),
                ],
              ),
              16.height,
              Row(
                children: [
                  Text('Distance ', style: boldTextStyle(color: appStore.isDarkModeOn ? white : bmSpecialColorDark)),
                  Text('${value.round().toString()} miles', style: primaryTextStyle(color: appStore.isDarkModeOn ? white : bmSpecialColorDark)),
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: bmPrimaryColor,
                  inactiveTrackColor: bmPrimaryColor.withAlpha(70),
                  trackShape: RectangularSliderTrackShape(),
                  trackHeight: 4.0,
                  thumbColor: bmPrimaryColor,
                  thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 12.0,
                  ),
                  overlayColor: bmPrimaryColor.withAlpha(32),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                ),
                child: Slider(
                  max: 20,
                  value: value,
                  onChanged: (val) {
                    setState(() {
                      value = val;
                    });
                  },
                ),
              ),
              16.height,
              Text('Others', style: boldTextStyle(color: appStore.isDarkModeOn ? white : bmSpecialColorDark)),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Special Offers', style: primaryTextStyle(color: appStore.isDarkModeOn ? white : bmSpecialColorDark)),
                  IconButton(
                    icon: specialChecked ? Icon(Icons.check_circle, color: bmPrimaryColor) : Icon(Icons.circle_outlined, color: bmPrimaryColor),
                    onPressed: () {
                      specialChecked = !specialChecked;
                      setState(() {});
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Mobile Services', style: primaryTextStyle(color: appStore.isDarkModeOn ? white : bmSpecialColorDark)),
                  IconButton(
                    icon: mobileChecked ? Icon(Icons.check_circle, color: bmPrimaryColor) : Icon(Icons.circle_outlined, color: bmPrimaryColor),
                    onPressed: () {
                      mobileChecked = !mobileChecked;
                      setState(() {});
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Online Services', style: primaryTextStyle(color: appStore.isDarkModeOn ? white : bmSpecialColorDark)),
                  IconButton(
                    icon: onlineChecked ? Icon(Icons.check_circle, color: bmPrimaryColor) : Icon(Icons.circle_outlined, color: bmPrimaryColor),
                    onPressed: () {
                      onlineChecked = !onlineChecked;
                      setState(() {});
                    },
                  ),
                ],
              ),
              16.height,
              Row(
                children: [
                  AppButton(
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32), side: BorderSide(color: bmPrimaryColor, width: 2)),
                    child: Text('Clear', style: boldTextStyle()),
                    padding: EdgeInsets.all(16),
                    color: context.cardColor,
                    onTap: () {
                      //
                    },
                  ),
                  16.width,
                  AppButton(
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                    child: Text('Show 45+ places', style: boldTextStyle(color: Colors.white)),
                    padding: EdgeInsets.all(16),
                    color: bmPrimaryColor,
                    onTap: () {
                      //
                    },
                  ).expand(),
                ],
              ),
              30.height,
            ],
          ).paddingAll(16);
        });
      });
}

void showBookBottomSheet(BuildContext context, BMServiceListModel element) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
      builder: (context) {
        return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    finish(context);
                  },
                  icon: Icon(Icons.cancel_rounded, color: bmTextColorDarkMode),
                ),
              ),
              titleText(title: element.name, size: 24),
              16.height,
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                style: primaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : bmSpecialColorDark),
              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      titleText(title: element.cost, size: 16, maxLines: 2),
                      Text(
                        element.time,
                        style: secondaryTextStyle(color: appStore.isDarkModeOn ? bmTextColorDarkMode : bmPrimaryColor),
                      )
                    ],
                  ),
                  AppButton(
                    //padding: EdgeInsets.all(0),
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                    child: Text('Book Now', style: boldTextStyle(color: Colors.white, size: 12)),
                    color: bmPrimaryColor,
                    onTap: () {
                      BMCalenderScreen(element: element, isStaffBooking: false).launch(context);
                    },
                  ),
                ],
              )
            ],
          ).paddingAll(16);
        });
      });
}

void showCommentBottomSheet(BuildContext context) {
  List<BMCommentModel> list = getCommentsList();

  TextEditingController comment = TextEditingController();
  var form_key = GlobalKey<FormState>();

  showModalBottomSheet(
      backgroundColor: appStore.isDarkModeOn ? bmSecondBackgroundColorDark : bmSecondBackgroundColorLight,
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
      builder: (context) {
        return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    finish(context);
                  },
                  icon: Icon(Icons.cancel_rounded, color: bmTextColorDarkMode),
                ),
              ).paddingOnly(right: 16, top: 16),
              titleText(title: 'Comments', size: 24).paddingSymmetric(horizontal: 16),
              16.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: list.map((e) {
                  return BMCommentComponent(element: e);
                }).toList(),
              ).paddingSymmetric(horizontal: 16),
              Form(
                key: form_key,
                child: Container(
                  decoration: BoxDecoration(color: context.cardColor, borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: bmPrimaryColor.withAlpha(50),
                          borderRadius: radius(32),
                          border: Border.all(color: bmPrimaryColor),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: AppTextField(
                          controller: comment,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Add comment',
                            hintStyle: secondaryTextStyle(color: bmPrimaryColor),
                          ),
                          textFieldType: TextFieldType.NAME,
                          cursorColor: bmPrimaryColor,
                        ),
                      ).flexible(flex: 3),
                      Container(
                        decoration: boxDecorationDefault(color: bmPrimaryColor, borderRadius: radius(100)),
                        child: IconButton(
                          icon: Icon(Icons.arrow_upward, color: Colors.white),
                          onPressed: () {
                            if (form_key.currentState!.validate() && comment.text != '') {
                              list.add(BMCommentModel(isSubComment: false, isLiked: false, likes: '0', name: 'You', message: comment.text, time: 'just now', image: 'images/face_two.jpg'));
                              setState(() {});
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        });
      });
}

void showSelectStaffBottomSheet(BuildContext context) {
  List<BMMasterModel> myMasterList = getMyMastersList();

  int selectedTab = 0;

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
      builder: (context) {
        return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    finish(context);
                  },
                  icon: Icon(Icons.cancel_rounded, color: bmTextColorDarkMode),
                ),
              ),
              titleText(title: 'Select Staff', size: 24),
              16.height,
              Wrap(
                children: myMasterList.map((e) {
                  int index = myMasterList.indexOf(e);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(e.image, height: 30, width: 30, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
                          8.width,
                          Text(e.name, style: primaryTextStyle(color: appStore.isDarkModeOn ? white : bmSpecialColorDark)),
                        ],
                      ),
                      IconButton(
                        icon: selectedTab == index ? Icon(Icons.check_circle, color: bmPrimaryColor) : Icon(Icons.circle_outlined, color: bmPrimaryColor),
                        onPressed: () {
                          selectedTab = index;
                          setState(() {});
                        },
                      ),
                    ],
                  );
                }).toList(),
              ),
              50.height,
              AppButton(
                shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.call, color: Colors.white),
                    6.width,
                    Text('Call Now', style: boldTextStyle(color: Colors.white)),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                color: bmPrimaryColor,
                onTap: () {
                  finish(context);
                  BMCallScreen(image: myMasterList[selectedTab].image).launch(context);
                },
              ).center(),
              30.height,
            ],
          ).paddingAll(16);
        });
      });
}
