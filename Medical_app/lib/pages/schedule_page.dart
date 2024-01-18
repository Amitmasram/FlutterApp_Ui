import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/widget.dart/scheduledWidget.dart';

import '../widget.dart/calenderWidget.dart';

class SchedulePage extends StatefulWidget {
  SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  int value = 0;
  List<Map<String, dynamic>> data = [
    {
      'date': '12',
      'day': 'Mon',
    },
    {
      'date': '13',
      'day': 'Tue',
    },
    {
      'date': '18',
      'day': 'Wed',
    },
    {
      'date': '14',
      'day': 'Thu',
    },
    {
      'date': '15',
      'day': 'Fri',
    },
    {
      'date': '16',
      'day': 'Sat',
    },
    {
      'date': '17',
      'day': 'Sun',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 70, right: 20),
            child: Row(
              children: [
                FadeInDown(
                  child: Text(
                    "Schedule",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          FadeInLeft(
            delay: const Duration(milliseconds: 500),
            child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                child: ListView.builder(
                    itemCount: data.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: index == 0 ? 20.0 : 10,
                            right: index == data.length - 1 ? 20 : 0),
                        child: GestureDetector(
                          onTap: () => setState(() {
                            value = index;
                          }),
                          child: CalenderWidget(
                              value: value, data: data, index: index),
                        ),
                      );
                    })),
          ),
          // Scheduled Appointment Widget.

          ScheduledWidget(),
        ],
      ),
    );
  }
}
