import 'dart:io';

import 'package:contraflutterkit/alarm/weather.dart';
import 'package:contraflutterkit/alarm/weather_widget.dart';
import 'package:contraflutterkit/custom_widgets/button_round_with_shadow.dart';
import 'package:contraflutterkit/login/contra_text.dart';
import 'package:contraflutterkit/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'circular_list_view.dart';

class WeatherDetailPage extends StatefulWidget {
  @override
  _WeatherDetailPageState createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  List<WeatherDate> days = <WeatherDate>[];
  List<int> items = <int>[];

  @override
  void initState() {
    super.initState();
    days.add(WeatherDate(
        color: black, day: "Mon", image: "assets/icons/ic_cloud_rain.svg"));
    days.add(WeatherDate(
        color: black, day: "Tue", image: "assets/icons/ic_sun.svg"));
    days.add(WeatherDate(
        color: black, day: "Wed", image: "assets/icons/ic_cloud_rain.svg"));
    days.add(WeatherDate(
        color: black, day: "Thu", image: "assets/icons/ic_sun.svg"));
    days.add(WeatherDate(
        color: black, day: "Fri", image: "assets/icons/ic_sun.svg"));
    days.add(WeatherDate(
        color: black, day: "Sat", image: "assets/icons/ic_sun.svg"));
    items.add(1);
    items.add(2);
    items.add(3);
    items.add(4);
    items.add(5);
    items.add(6);
    items.add(7);
    items.add(8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                kIsWeb || Platform.isIOS
                    ? SizedBox(
                        width: 20,
                      )
                    : SizedBox(),
                kIsWeb || Platform.isIOS
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              ButtonRoundWithShadow(
                                  size: 48,
                                  borderColor: wood_smoke,
                                  color: white,
                                  callback: () {
                                    Navigator.pop(context);
                                  },
                                  shadowColor: wood_smoke,
                                  iconPath: "assets/icons/arrow_back.svg"),
                            ],
                          ),
                        ],
                      )
                    : SizedBox(),
                SizedBox(
                  height: 80,
                ),
                ContraText(
                  text: "11:30 AM, Sunday",
                  color: black,
                  size: 17,
                  weight: FontWeight.bold,
                  alignment: Alignment.center,
                ),
                ContraText(
                  text: "New york",
                  alignment: Alignment.center,
                  color: black,
                  size: 36,
                  weight: FontWeight.w800,
                ),
                SizedBox(
                  height: 80,
                ),
//              Padding(
//                padding: const EdgeInsets.all(24.0),
//                child: Container(
//                  decoration: new BoxDecoration(
//                    color: white,
//                    shape: BoxShape.circle,
//                    border: new Border.all(
//                      color: Colors.black,
//                      width: 5,
//                    ),
//                  ),
//                  child: Container(
//                    width: 100,
//                    height: 100,
//                  ),
//                ),
//              ),
                SizedBox(
                  height: kIsWeb ? 250 : 180,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    ContraText(
                      text: "85",
                      alignment: Alignment.center,
                      color: black,
                      size: 94,
                      weight: FontWeight.w800,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: ContraText(
                        text: "\u2109",
                        alignment: Alignment.center,
                        color: black,
                        size: 27,
                        weight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                ContraText(
                  text: "Sunny",
                  alignment: Alignment.center,
                  color: trout,
                  size: 24,
                  weight: FontWeight.bold,
                ),
                SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                        direction: Axis.horizontal,
                        verticalDirection: VerticalDirection.down,
                        children:
                            List<Widget>.generate(days.length, (int index) {
                          return WeatherWidget(date: days[index]);
                        })),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
            Container(
              padding: kIsWeb
                  ? EdgeInsets.only(left: 150)
                  : EdgeInsets.only(left: 0),
              child: CircularListView(
                items: items,
                radius: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
