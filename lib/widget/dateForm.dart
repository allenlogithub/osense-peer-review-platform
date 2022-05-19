import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'package:peerrev/util/layout.dart';

class DateForm extends StatelessWidget {
  final Color color;
  final IconData? icon;
  final String? helperText;
  final int? helperMaxLines;
  final TextEditingController controller;
  final Function(String s) callback;
  const DateForm({
    Key? key,
    required this.color,
    this.icon,
    this.helperText,
    this.helperMaxLines,
    required this.controller,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(Layout.commonBorderRadius)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: color, width: Layout.commonBorderWidth),
                    borderRadius: BorderRadius.all(
                        Radius.circular(Layout.commonBorderRadius)),
                  ),
                  helperText: helperText,
                  helperMaxLines: helperMaxLines ?? 3,
                  helperStyle: TextStyle(color: color),
                  suffixIcon: Container(
                    child: IconButton(
                        icon: Icon(
                          Icons.calendar_today_outlined,
                          color: color,
                        ),
                        onPressed: () async {
                          final datetime = await showDatePicker(
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2022, 01),
                            lastDate: DateTime(2099, 12),
                            context: context,
                          );
                          var outputFormat = DateFormat('yyyy/MM/dd');
                          callback(outputFormat.format(datetime!));
                        }),
                  ))),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Icon(
          icon,
          color: color,
        ),
      ],
    );
  }
}
