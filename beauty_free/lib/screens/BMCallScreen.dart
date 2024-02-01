import 'package:beauty_master/screens/BMPurchaseMoreScreen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/BMColors.dart';

class BMCallScreen extends StatefulWidget {
  String? image;

  BMCallScreen({this.image});

  @override
  State<BMCallScreen> createState() => _BMCallScreenState();
}

class _BMCallScreenState extends State<BMCallScreen> {
  @override
  void initState() {
    setStatusBarColor(Colors.transparent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.height(),
        width: context.width(),
        child: Stack(
          children: [
            PurchaseMoreScreen(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/face_two.jpg',
                  height: 150,
                  width: 110,
                  fit: BoxFit.cover,
                ).cornerRadiusWithClipRRect(24).paddingSymmetric(vertical: 46, horizontal: 20),
                Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(borderRadius: radiusOnly(topLeft: 32, topRight: 32), color: bmSpecialColorDark.withOpacity(0.7)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.videocam_off,
                            color: bmPrimaryColor,
                            size: 30,
                          ),
                          8.height,
                          Text('Video', style: primaryTextStyle(color: bmPrimaryColor))
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.flip_camera_ios,
                            color: bmPrimaryColor,
                            size: 30,
                          ),
                          8.height,
                          Text('Flip', style: primaryTextStyle(color: bmPrimaryColor))
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.mic_off,
                            color: bmPrimaryColor,
                            size: 30,
                          ),
                          8.height,
                          Text('Mute', style: primaryTextStyle(color: bmPrimaryColor))
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(color: Colors.red, borderRadius: radius(100)),
                            child: Icon(
                              Icons.call_end,
                              color: Colors.white,
                            ),
                          ),
                          Text('End', style: primaryTextStyle(color: bmPrimaryColor))
                        ],
                      ).onTap(() {
                        finish(context);
                      }, borderRadius: radius(100)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
