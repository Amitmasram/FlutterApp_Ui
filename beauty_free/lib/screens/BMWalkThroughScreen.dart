import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../utils/BMColors.dart';
import '../utils/BMDataGenerator.dart';
import 'BMDashboardScreen.dart';
import 'BMLoginScreen.dart';
import 'BMRegisterScreen.dart';

class BMWalkThroughScreen extends StatefulWidget {
  const BMWalkThroughScreen({Key? key}) : super(key: key);

  @override
  _BMWalkThroughScreenState createState() => _BMWalkThroughScreenState();
}

class _BMWalkThroughScreenState extends State<BMWalkThroughScreen> {
  List<WalkThroughModelClass> walkThroughList = getWalkThroughList();

  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;

  @override
  void initState() {
    setStatusBarColor(Colors.transparent);
    super.initState();
  }

  @override
  void dispose() {
    setStatusBarColor(appStore.scaffoldBackground!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: context.width(),
                  height: context.height(),
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: walkThroughList.length,
                    itemBuilder: (context, i) {
                      return Image.asset(walkThroughList[i].image!, fit: BoxFit.cover);
                    },
                    onPageChanged: (value) {
                      setState(() => currentIndexPage = value);
                    },
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 30,
                  child: Text('SKIP', style: boldTextStyle(color: white, size: 14)).onTap(() {
                    BMDashboardScreen(flag: false).launch(context, isNewTask: true);
                  }),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(walkThroughList[currentIndexPage].title!, style: boldTextStyle(size: 24, color: white)),
                    16.height,
                    Text(walkThroughList[currentIndexPage].subTitle!, style: primaryTextStyle(color: white), textAlign: TextAlign.center),
                    32.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < walkThroughList.length; i++)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            height: 4,
                            width: i == currentIndexPage ? 30 : 14,
                            decoration: BoxDecoration(
                              color: i == currentIndexPage ? white : Colors.grey,
                              borderRadius: radius(12),
                            ),
                          ),
                      ],
                    ),
                    40.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppButton(
                          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                          child: Text('Login Now', style: boldTextStyle(color: Colors.white)),
                          padding: EdgeInsets.all(16),
                          width: 150,
                          color: bmPrimaryColor,
                          onTap: () {
                            BMLoginScreen().launch(context, isNewTask: true);
                          },
                        ),
                        16.width,
                        AppButton(
                          child: Text('Join Now', style: boldTextStyle(color: Colors.white)),
                          width: 150,
                          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                          padding: EdgeInsets.all(16),
                          color: Colors.grey,
                          onTap: () {
                            BMRegisterScreen().launch(context, isNewTask: true);
                          },
                        ),
                      ],
                    ),
                    50.height,
                  ],
                ).paddingOnly(bottom: 24, right: 16, left: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
