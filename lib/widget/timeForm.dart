import 'package:flutter/material.dart';

import 'package:peerrev/util/layout.dart';
import 'package:peerrev/util/style.dart' as style;
import 'package:peerrev/util/formatChange.dart';
import 'package:peerrev/util/formatCheck.dart';

// WARNING:
// - a manual typing output might not generate a constant result, for example,
//   time:7:7 will not return String:07:07(HH/mm), need to handle
//   it.
//   - Code:
//     var outputFormat = DateFormat(format);
//     final DateTime datetime = DateFormat(format).parseStrict(timeString);
//     return outputFormat.format(datetime);
class TimeForm extends StatelessWidget {
  final Color color;
  final IconData? icon;
  final String? helperText;
  final int? helperMaxLines;
  final TextEditingController controller;
  const TimeForm(
      {Key? key,
      required this.color,
      this.icon,
      this.helperText,
      this.helperMaxLines,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String timeFormat = 'HH:mm';

    return Row(
      children: [
        Expanded(
            child: FocusTraversalGroup(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: TextFormField(
              validator: (String? value) {
                return (FormatCheck.isTime(value!, timeFormat))
                    ? null
                    : 'DateForm:input format is, $timeFormat';
              },
              controller: controller,
              onSaved: (String? value) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(Layout.commonBorderRadius)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: color, width: Layout.commonBorderWidth),
                  borderRadius: BorderRadius.all(
                      Radius.circular(Layout.commonBorderRadius)),
                ),
                hintText: timeFormat,
                hintStyle: TextStyle(color: style.GrayColor.grey),
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
                      final datetime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.input,
                      );
                      controller.text =
                          FormatChange.getTimeStringFromTimeOfDay(datetime!);
                    },
                  ),
                ),
              ),
            ),
          ),
        )),
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
