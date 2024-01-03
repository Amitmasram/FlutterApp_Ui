import 'package:epay_flutter/utils/GPColors.dart';
import 'package:epay_flutter/utils/GPImages.dart';
import 'package:epay_flutter/utils/NumericPad.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nb_utils/nb_utils.dart';

class GPPayComponent extends StatefulWidget {
  static String tag = '/GPPayComponent';

  @override
  GPPayComponentState createState() => GPPayComponentState();
}

class GPPayComponentState extends State<GPPayComponent> {
  String? title;
  String text = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await 500.milliseconds.delay;
    setStatusBarColor(GPAppColor, statusBarBrightness: Brightness.light, statusBarIconBrightness: Brightness.light);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    setStatusBarColor(Colors.white);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GPAppColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: GPAppColor,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.close, color: backgroundColor),
            onPressed: () {
              finish(context);
            },
          ),
          actions: [
            PopupMenuButton(
              icon: Icon(Icons.more_vert_outlined, color: backgroundColor),
              onSelected: (dynamic v) {
                toast('Click');
              },
              itemBuilder: (BuildContext context) {
                List<PopupMenuEntry<Object>> list = [];
                list.add(
                  PopupMenuItem(
                    child: Text("Send feedback", style: TextStyle(color: GPColorBlack)),
                    value: 1,
                  ),
                );
                return list;
              },
            )
          ],
        ),
        body: Stack(
          children: [
            Container(
              height: context.height() * 0.58,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: backgroundColor,
                        child: CircleAvatar(radius: 20, backgroundImage: AssetImage(GPAY_user)),
                      ),
                      5.width,
                      Icon(Icons.arrow_forward, color: backgroundColor),
                      5.width,
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: backgroundColor,
                        child: CircleAvatar(radius: 20, backgroundImage: AssetImage(GP_user3)),
                      ),
                    ],
                  ),
                  5.height,
                  Text("Paying Vi Prepaid", style: primaryTextStyle(color: backgroundColor, size: 14)),
                  15.height,
                  Text('\u{20B9} $text', style: primaryTextStyle(color: backgroundColor, size: 40, weight: FontWeight.bold)),
                  5.height,
                  Container(
                    height: 50,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25)), color: Colors.blue[900]),
                    child: Text("What is this for?", style: primaryTextStyle(size: 14, color: backgroundColor), textAlign: TextAlign.center),
                  ),
                  40.height,
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
                      child: IconButton(
                        icon: Icon(Icons.navigate_next, color: GPAppColor),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  color: backgroundColor,
                  child: NumericKeyboard(
                    onKeyboardTap: (value) {
                      text = text + value;
                      setState(() {});
                    },
                    textColor: GPColorBlack,
                    leftButtonFn: () {
                      setState(() {
                        text = text.substring(0, text.length - 1);
                      });
                    },
                    leftIcon: Icon(Icons.backspace_outlined, color: GPColorBlack),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
