import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/BMDataGenerator.dart';
import '../utils/BMWidgets.dart';
import 'BMAppointmentComponent.dart';

class BMAppointMentTabComponent extends StatelessWidget {
  bool tabOne;

  BMAppointMentTabComponent({required this.tabOne});

  getCurrentDate() {
    return DateFormat.yMMMMd('en_US').format(DateTime.now());
  }

  getTomorrowDate() {
    return DateFormat.yMMMMd('en_US').format(DateTime.now().add(const Duration(days: 1)));
  }

  getYesterdayDate() {
    return DateFormat.yMMMMd('en_US').format(DateTime.now().subtract(const Duration(days: 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        titleText(title: 'Today, ${getCurrentDate()}'),
        16.height,
        Column(
          mainAxisSize: MainAxisSize.min,
          children: getAppointments().map((e) {
            return BMAppointmentComponent(element: e);
          }).toList(),
        ),
        20.height,
        titleText(title: tabOne ? getTomorrowDate() : 'Yesterday, ${getYesterdayDate()}'),
        20.height,
        Column(
          mainAxisSize: MainAxisSize.min,
          children: getMoreAppointmentsList().map((e) {
            return BMAppointmentComponent(element: e);
          }).toList(),
        )
      ],
    );
  }
}
