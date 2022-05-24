import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'package:peerrev/util/layout.dart';
import 'package:peerrev/util/style.dart' as style;
import 'package:peerrev/util/formatCheck.dart';

// WARNING:
// - a manual typing output might not generate a constant result, for example,
//   date:2020/5/5 will not return String:2020/05/05(yyyy/MM/dd), need to handle
//   it.
//   - Code:
//     var outputFormat = DateFormat('yyyy/MM/dd');
//     final DateTime datetime = DateFormat('yyyy/MM/dd').parseStrict(s);
//     String d = outputFormat.format(datetime);
class DateForm extends StatelessWidget {
  final Color color;
  final IconData? icon;
  final String? helperText;
  final int? helperMaxLines;
  final TextEditingController controller;
  const DateForm({
    Key? key,
    required this.color,
    this.icon,
    this.helperText,
    this.helperMaxLines,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String dateFormat = 'yyyy/MM/dd';
    var outputFormat = DateFormat(dateFormat);

    if (controller.text == '') {
      controller.text = outputFormat.format(DateTime.now());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: FocusTraversalGroup(
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: TextFormField(
                      validator: (String? value) {
                        return (FormatCheck.isTime(value!, dateFormat))
                            ? null
                            : 'DateForm:input format is, $dateFormat';
                      },
                      controller: controller,
                      onSaved: (String? value) {},
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
                        hintText: dateFormat,
                        hintStyle: style.Text.normH5
                            .copyWith(color: style.GrayColor.grey),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.calendar_today_outlined,
                            color: color,
                            size: Layout.iconSize,
                          ),
                          onPressed: () async {
                            final datetime = await showDatePicker(
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2022, 01),
                              lastDate: DateTime(2099, 12),
                              context: context,
                              initialEntryMode:
                                  DatePickerEntryMode.calendarOnly,
                            );
                            controller.text = outputFormat.format(datetime!);
                          },
                          padding: EdgeInsets.only(
                            right: Layout.commonPadding,
                            bottom: Layout.commonPadding,
                            top: Layout.commonPadding,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(
                          left: Layout.commonPadding,
                          top: Layout.commonPadding,
                          bottom: Layout.commonPadding,
                        ),
                      )),
                ),
              ),
            ),
            if (icon != null) ...[
              SizedBox(
                width: Layout.widgetSpace,
              ),
              Icon(
                icon,
                color: color,
                size: Layout.iconSize,
              ),
            ],
          ],
        ),
        if (helperText != null) ...[
          SizedBox(
            height: Layout.widgetSpace,
          ),
          Text(
            helperText!,
            style: style.Text.normH5.copyWith(color: color),
          ),
        ],
      ],
    );
  }
}
