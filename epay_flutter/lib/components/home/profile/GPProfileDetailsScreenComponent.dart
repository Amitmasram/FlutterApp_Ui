import 'package:epay_flutter/utils/AppWidget.dart';
import 'package:epay_flutter/utils/GPColors.dart';
import 'package:epay_flutter/utils/GPImages.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:share/share.dart';

class GPProfileDetailsScreenComponent extends StatefulWidget {
  static String tag = '/GPProfileDetailsScreenComponent';

  @override
  GPProfileDetailsScreenComponentState createState() =>
      GPProfileDetailsScreenComponentState();
}

class GPProfileDetailsScreenComponentState
    extends State<GPProfileDetailsScreenComponent> {
  var pageController = PageController();
  List<Widget> pages = [];
  var selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    pages = [scanMySpotCodeWidget(context), qrScannerWidget()];
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
          body: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.close, color: GPColorBlack),
                    onPressed: () {
                      finish(context);
                    },
                  ).paddingLeft(12),
                  DotIndicator(
                          pages: pages,
                          pageController: pageController,
                          indicatorColor: Colors.grey)
                      .expand(),
                  PopupMenuButton(
                    icon: Icon(Icons.more_vert_outlined, color: GPColorBlack),
                    onSelected: (dynamic v) {},
                    itemBuilder: (BuildContext context) {
                      List<PopupMenuEntry<Object>> list = [];
                      list.add(
                        PopupMenuItem(
                            child: Text("Send feedback",
                                style: TextStyle(color: GPColorBlack)),
                            value: 1),
                      );
                      return list;
                    },
                  )
                ],
              ),
              15.height,
              PageView(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                children: pages,
                onPageChanged: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
              ).expand(),
            ],
          )),
    );
  }
}

Widget scanMySpotCodeWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      CircleAvatar(
        radius: 140,
        backgroundImage: AssetImage(GP_dotted_profile_img),
        child: Stack(
          children: [
            CircleAvatar(radius: 50, backgroundImage: AssetImage(GPAY_user)),
          ],
        ),
      ),
      20.height,
      Text("John Lewis",
          style: primaryTextStyle(size: 22, color: GPColorBlack)),
      15.height,
      Text("Scan my Spot Code to connect",
          style: primaryTextStyle(size: 14, color: GPColorBlack)),
      60.height,
      TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          backgroundColor: GPAppColor,
          primary: backgroundColor,
          padding: EdgeInsets.all(8),
        ),
        onPressed: () async {
          await Share.share('share Link');
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.share, color: backgroundColor),
            Text(
              "Share profile link",
              style: primaryTextStyle(
                color: backgroundColor,
                weight: FontWeight.bold,
                size: 14,
              ),
              textAlign: TextAlign.center,
            ).expand(),
          ],
        ),
      ).paddingOnly(left: 60, right: 60),
      10.height,
      TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.grey[300]!)),
          backgroundColor: Colors.white,
          primary: Colors.grey,
          padding: EdgeInsets.all(8),
        ),
        onPressed: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.qr_code_scanner, color: grey),
            Text(
              "Open scanner",
              style: primaryTextStyle(
                  color: grey, size: 14, weight: FontWeight.bold),
              textAlign: TextAlign.center,
            ).expand(),
          ],
        ),
      ).paddingOnly(left: 60, right: 60),
    ],
  );
}

Widget qrScannerWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      commonCacheImageWidget(GP_qr_scanner_img_big,
          height: 280, width: 280, fit: BoxFit.fill),
      20.height,
      Text("liasmith@epay.com", style: secondaryTextStyle(size: 12)),
      30.height,
      Text("Lia Smith",
          style: primaryTextStyle(
              size: 18, color: GPColorBlack, weight: FontWeight.bold)),
      15.height,
      Text("liasmith@epay.com",
          style: primaryTextStyle(size: 13, color: GPColorBlack)),
      Text("+91 9876543210",
          style: primaryTextStyle(size: 13, color: GPColorBlack)),
      20.height,
      Text("Scan my code to pay",
          style: primaryTextStyle(size: 14, color: GPColorBlack)),
      60.height,
      TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.grey[300]!)),
          backgroundColor: Colors.white,
          primary: Colors.grey,
          padding: EdgeInsets.all(8),
        ),
        onPressed: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.qr_code_scanner, color: grey),
            Text(
              "Open scanner",
              style: primaryTextStyle(
                  color: grey, size: 14, weight: FontWeight.bold),
              textAlign: TextAlign.center,
            ).expand(),
          ],
        ),
      ).paddingOnly(left: 60, right: 60),
    ],
  );
}
