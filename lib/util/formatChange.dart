import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class FormatChange {
  static String getTimeStringFromTimeOfDay(TimeOfDay t) {
    String H = (t.hour < 10) ? '0' + t.hour.toString() : t.hour.toString();
    String m =
        (t.minute < 10) ? '0' + t.minute.toString() : t.minute.toString();
    return '$H:$m';
  }

  static String getFormattedTimeString(String timeString, format) {
    var outputFormat = DateFormat(format);
    final DateTime datetime = DateFormat(format).parseStrict(timeString);
    return outputFormat.format(datetime);
  }
}
