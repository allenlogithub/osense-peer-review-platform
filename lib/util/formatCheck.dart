import 'package:intl/intl.dart';

class FormatCheck {
  static bool isTime(String input, String format) {
    try {
      final DateTime _ = DateFormat(format).parseStrict(input);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool isBetweenNumbers(String stringInt, int maximum, minimum) {
    try {
      int.parse(stringInt);
    } catch (e) {
      return false;
    }
    if (int.parse(stringInt) > maximum) {
      return false;
    }
    if (int.parse(stringInt) < minimum) {
      return false;
    }

    return true;
  }
}
