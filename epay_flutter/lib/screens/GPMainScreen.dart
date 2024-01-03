import 'package:epay_flutter/screens/GPHomeScreen.dart';
import 'package:epay_flutter/screens/GPQrScannerComponent.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GPMainScreen extends StatefulWidget {
  static String tag = '/GPMainScreen';

  @override
  GPMainScreenState createState() => GPMainScreenState();
}

class GPMainScreenState extends State<GPMainScreen> {
  PageController? controller;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    controller = PageController(initialPage: currentPage);

    setStatusBarColor(Colors.black, statusBarIconBrightness: Brightness.dark, statusBarBrightness: Brightness.dark);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: PageView(
          reverse: true,
          pageSnapping: true,
          onPageChanged: (index) {
            currentPage = index;
          },
          children: [
            GPHomeScreen(),
            GPQrScannerComponent(),
          ],
        ),
      ),
    );
  }
}
