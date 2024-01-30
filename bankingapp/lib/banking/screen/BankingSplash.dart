import 'dart:async';

import 'package:bankingapp/banking/screen/BankingWalkThrough.dart';
import 'package:bankingapp/banking/utils/BankingColors.dart';
import 'package:bankingapp/banking/utils/BankingContants.dart';
import 'package:bankingapp/banking/utils/BankingImages.dart';
import 'package:bankingapp/banking/utils/BankingStrings.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class BankingSplash extends StatefulWidget {
  static String tag = '/BankingSplash';

  @override
  _BankingSplashState createState() => _BankingSplashState();
}

class _BankingSplashState extends State<BankingSplash> {
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    setState(() {
      BankingWalkThrough().launch(context, isNewTask: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topLeft,
              colors: [Banking_Primary, Banking_palColor],
            )),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(Banking_app_logo),
                    ),
                  ),
                ),
                16.height,
                Text(Banking_lbl_app_Name, style: boldTextStyle(color: Banking_TextColorWhite, size: 30)).paddingOnly(bottom: spacing_standard),
                Text(Banking_lbl_app_Sub_title, style: boldTextStyle(color: Banking_TextColorWhite, size: 14)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
