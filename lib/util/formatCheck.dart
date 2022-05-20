import 'package:intl/intl.dart';

class FormatCheck {
  static bool isDate(String input, String format) {
    try {
      final DateTime _ = DateFormat(format).parseStrict(input);
      return true;
    } catch (e) {
      return false;
    }
  }
}
