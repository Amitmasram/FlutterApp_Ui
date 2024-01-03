import 'package:epay_flutter/screens/GPMainScreen.dart';
import 'package:epay_flutter/utils/GPColors.dart';
import 'package:epay_flutter/utils/GPImages.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GPSplashScreen extends StatefulWidget {
  static String tag = '/GPSplashScreen';

  @override
  GPSplashScreenState createState() => GPSplashScreenState();
}

class GPSplashScreenState extends State<GPSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await Future.delayed(Duration(seconds: 2));

    finish(context);
    //setStatusBarColor(backgroundColor, statusBarIconBrightness: Brightness.dark, statusBarBrightness: Brightness.dark);

    GPMainScreen().launch(context);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(GPAY_ic_app_logo, height: 120).center(),
            Positioned(
              bottom: 40,
              child: Text("EPay", style: secondaryTextStyle(color: darkGray, size: 26, weight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
