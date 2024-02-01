import 'package:beauty_master/main.dart';
import 'package:flutter/material.dart';

import '../utils/BMColors.dart';
import '../utils/flutterCalender/CleanCalendar.dart';

class BMCalenderComponent extends StatefulWidget {
  const BMCalenderComponent({Key? key}) : super(key: key);

  @override
  _BMCalenderComponentState createState() => _BMCalenderComponentState();
}

class _BMCalenderComponentState extends State<BMCalenderComponent> {
  Map<DateTime, List> _events = Map<DateTime, List>();
  List _selectedEvents = [];
  DateTime _selectedDay = DateTime.now();
  int? i;

  @override
  void initState() {
    super.initState();
    _selectedEvents = _events[_selectedDay] ?? [];
    init();
  }

  init() async {
    _events = {
      DateTime(_selectedDay.year, _selectedDay.month, 7): [],
    };
  }

  void _handleNewDate(date) {
    setState(() {
      _selectedDay = date;
      _selectedEvents = _events[_selectedDay] ?? [];
    });
    print(_selectedEvents);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16),
      child: Calendar(
        startOnMonday: false,
        weekDays: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
        events: _events,
        onRangeSelected: (range) => print("Range is ${range.from}, ${range.to}"),
        onDateSelected: (date) => _handleNewDate(date),
        isExpandable: false,
        isExpanded: true,
        selectedColor: bmPrimaryColor,
        hideTodayIcon: true,
        hideArrows: true,
        eventColor: bmPrimaryColor,
        todayColor: bmPrimaryColor,
        dayOfWeekStyle: TextStyle(color: appStore.isDarkModeOn ? Colors.white : bmPrimaryColor, fontWeight: FontWeight.w800, fontSize: 11),
      ),
    );
  }
}
