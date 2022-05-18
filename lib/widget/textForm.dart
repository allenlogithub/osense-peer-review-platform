import 'package:flutter/material.dart';

import 'package:peerrev/util/layout.dart';
import 'package:peerrev/util/style.dart' as style;

class TextForm extends StatelessWidget {
  final Color color;
  final IconData? icon;
  final String? labelText;
  final TextEditingController controller;

  const TextForm({
    Key? key,
    required this.color,
    this.icon,
    this.labelText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
        hintText: labelText ?? '',
        hintStyle: TextStyle(color: style.GrayColor.grey),
        suffixIcon: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
