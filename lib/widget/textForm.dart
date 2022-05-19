import 'package:flutter/material.dart';

import 'package:peerrev/util/layout.dart';
import 'package:peerrev/util/style.dart' as style;

class TextForm extends StatelessWidget {
  final Color color;
  final IconData? icon;
  final String? labelText;
  final String? helperText;
  final int? helperMaxLines;
  final int? maxLines;
  final TextEditingController controller;

  const TextForm({
    Key? key,
    required this.color,
    this.icon,
    this.labelText,
    this.helperText,
    this.helperMaxLines,
    this.maxLines,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconYPosition = 0;
    bool isTextArea = (maxLines != null);

    if (isTextArea) {
      if (maxLines! <= 1) {
        throw InvalidInputException('TextForm:maxLines should greater than 1');
      }
      iconYPosition = maxLines! * 19 + 2;
    }

    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(Layout.commonBorderRadius)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color, width: Layout.commonBorderWidth),
          borderRadius:
              BorderRadius.all(Radius.circular(Layout.commonBorderRadius)),
        ),
        hintText: labelText,
        hintStyle: TextStyle(color: style.GrayColor.grey),
        helperText: helperText,
        helperMaxLines: helperMaxLines ?? 3,
        helperStyle: TextStyle(color: color),
        suffixIcon: isTextArea
            ? Column(
                children: [
                  SizedBox(
                    height: iconYPosition,
                  ),
                  Icon(
                    icon,
                    color: color,
                  ),
                ],
              )
            : Icon(
                icon,
                color: color,
              ),
      ),
    );
  }
}

class TextFormException implements Exception {
  final _message;
  final _prefix;

  TextFormException([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class InvalidInputException extends TextFormException {
  InvalidInputException([String message = ''])
      : super(message, 'Invalid input: ');
}
