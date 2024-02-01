import 'package:beauty_master/screens/BMCallScreen.dart';
import 'package:beauty_master/screens/BMChatScreen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/BMOurServiveComponent.dart';
import '../components/BMPortfolioComponent.dart';
import '../main.dart';
import '../models/BMCommonCardModel.dart';
import '../models/BMMessageModel.dart';
import '../utils/BMColors.dart';
import '../utils/BMWidgets.dart';
import '../utils/flutter_rating_bar.dart';
import 'BMSingleImageScreen.dart';

class BMSingleComponentScreen extends StatefulWidget {
  BMCommonCardModel element;

  BMSingleComponentScreen({required this.element});

  @override
  _BMSingleComponentScreenState createState() => _BMSingleComponentScreenState();
}

class _BMSingleComponentScreenState extends State<BMSingleComponentScreen> {
  List<String> tabList = ['OUR SERVICES', 'PORTFOLIO', 'STORE', 'ABOUT', 'REVIEW'];

  int selectedTab = 0;

  Widget getSelectedTabComponent() {
    if (selectedTab == 0) {
      return BMOurServiveComponent();
    } else {
      return BMPortfolioComponent();
    }
  }

  @override
  void initState() {
    setStatusBarColor(Colors.transparent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        physics: NeverScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: bmPrimaryColor),
                onPressed: () {
                  finish(context);
                },
              ).visible(innerBoxIsScrolled),
              title: titleText(title: widget.element.title).visible(innerBoxIsScrolled),
              actions: [
                IconButton(
                  icon: Icon(Icons.subdirectory_arrow_right, color: bmPrimaryColor),
                  onPressed: () {
                    BMSingleImageScreen(element: widget.element).launch(context);
                  },
                ).visible(innerBoxIsScrolled),
                IconButton(
                  icon: widget.element.liked! ? Icon(Icons.favorite, color: bmPrimaryColor) : Icon(Icons.favorite_outline, color: bmPrimaryColor),
                  onPressed: () {
                    widget.element.liked = !widget.element.liked!;
                    setState(() {});
                  },
                ).visible(innerBoxIsScrolled),
              ],
              leadingWidth: 30,
              pinned: true,
              elevation: 0.5,
              expandedHeight: 450,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(bottom: 66, left: 30, right: 50),
                collapseMode: CollapseMode.parallax,
                background: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          widget.element.image,
                          height: 300,
                          width: context.width(),
                          fit: BoxFit.cover,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Icon(Icons.arrow_back, color: bmPrimaryColor),
                              decoration: BoxDecoration(
                                borderRadius: radius(100),
                                color: context.cardColor,
                              ),
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.only(left: 16, top: 30),
                            ).onTap(() {
                              finish(context);
                            }, borderRadius: radius(100)),
                            Row(
                              children: [
                                Container(
                                  child: Icon(Icons.subdirectory_arrow_right, color: bmPrimaryColor),
                                  decoration: BoxDecoration(
                                    borderRadius: radius(100),
                                    color: context.cardColor,
                                  ),
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.only(right: 16, top: 30),
                                ).onTap(() {
                                  BMSingleImageScreen(element: widget.element).launch(context);
                                }, borderRadius: radius(100)),
                                Container(
                                  child: widget.element.liked! ? Icon(Icons.favorite, color: bmPrimaryColor) : Icon(Icons.favorite_outline, color: bmPrimaryColor),
                                  decoration: BoxDecoration(
                                    borderRadius: radius(100),
                                    color: context.cardColor,
                                  ),
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.only(right: 16, top: 30),
                                ).onTap(() {
                                  widget.element.liked = !widget.element.liked!;
                                  setState(() {});
                                }, borderRadius: radius(100)),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      color: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          titleText(title: widget.element.title),
                          8.height,
                          Text(
                            widget.element.subtitle!,
                            style: secondaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : bmPrimaryColor, size: 12),
                          ),
                          8.height,
                          Row(
                            children: [
                              Text(widget.element.rating!, style: boldTextStyle()),
                              2.width,
                              RatingBar(
                                initialRating: widget.element.rating.toDouble(),
                                minRating: 5,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 18,
                                itemPadding: EdgeInsets.symmetric(horizontal: 0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  //
                                },
                              ),
                              6.width,
                              Text(widget.element.comments!, style: secondaryTextStyle(color: bmTextColorDarkMode)),
                            ],
                          ),
                          8.height,
                          Wrap(
                            spacing: 16,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: bmPrimaryColor),
                                  color: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
                                  borderRadius: radius(32),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.call_outlined, color: bmPrimaryColor),
                                    4.width,
                                    Text('Call us', style: boldTextStyle(color: bmPrimaryColor)),
                                  ],
                                ),
                              ).onTap(() {
                                BMCallScreen().launch(context);
                              }, borderRadius: radius(32)),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: bmPrimaryColor),
                                  color: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
                                  borderRadius: radius(32),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset('images/chat.png', height: 20, color: bmPrimaryColor),
                                    8.width,
                                    Text('Send Message', style: boldTextStyle(color: bmPrimaryColor)),
                                  ],
                                ),
                              ).onTap(() {
                                BMChatScreen(
                                    element: BMMessageModel(
                                  image: widget.element.image,
                                  name: widget.element.title,
                                  message: 'Do you want to confirm yor appointment?',
                                  isActive: false,
                                  lastSeen: 'today , at 11:30 am',
                                )).launch(context);
                              }),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(
          decoration: BoxDecoration(
            color: appStore.isDarkModeOn ? bmSecondBackgroundColorDark : bmSecondBackgroundColorLight,
            borderRadius: radiusOnly(topLeft: 32, topRight: 32),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                16.height,
                HorizontalList(
                  itemCount: tabList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: radius(32),
                        color: selectedTab == index ? bmPrimaryColor : Colors.transparent,
                      ),
                      padding: EdgeInsets.all(8),
                      child: Text(
                        tabList[index],
                        style: boldTextStyle(
                          size: 12,
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
                  },
                ),
                getSelectedTabComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
