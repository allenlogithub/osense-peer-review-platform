class CustomWidgetException implements Exception {
  final _message;
  final _prefix;

  CustomWidgetException([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class InvalidInputException extends CustomWidgetException {
  InvalidInputException([String message = ''])
      : super(message, 'Invalid input: ');
}
