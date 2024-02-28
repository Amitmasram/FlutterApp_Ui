import 'package:flutter/material.dart';

class ExtractTime{

  static DateTime formatTimeToDate(TimeOfDay time){
    return DateTime(0, 0, 0, time.hour, time.minute);
  }

  static TimeOfDay extractTime(DateTime date){
    return TimeOfDay(hour: date.hour, minute: date.minute);
  }

}
