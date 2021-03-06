import 'package:flutter/material.dart';

import 'package:peerrev/util/layout.dart';
import 'package:peerrev/util/style.dart' as style;

class SelectForm extends StatelessWidget {
  final List<dynamic> items;
  late dynamic selected;
  final Function(dynamic) callback;
  final Color color;
  final IconData? icon;
  SelectForm({
    Key? key,
    required this.items,
    required this.selected,
    required this.callback,
    required this.color,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: color, width: Layout.commonBorderWidth),
            borderRadius:
                BorderRadius.all(Radius.circular(Layout.commonBorderRadius)),
          ),
          contentPadding: EdgeInsets.only(
              left: Layout.commonPadding, right: Layout.commonPadding),
        ),
        child: Row(
          children: [
            Expanded(
              child: DropdownButton(
                value: selected,
                icon: icon != null
                    ? Icon(
                        icon,
                        color: color,
                        size: Layout.iconSize,
                      )
                    : const Icon(
                        Icons.abc,
                        color: Colors.transparent,
                      ),
                items: items.map<DropdownMenuItem<dynamic>>((dynamic value) {
                  return DropdownMenuItem<dynamic>(
                      value: value,
                      child: value != selected
                          ? Text(
                              value.toString(),
                              style: style.Text.normH5.copyWith(color: color),
                            )
                          : Text(value.toString()));
                }).toList(),
                onChanged: (dynamic newValue) {
                  callback(newValue!);
                },
                style: style.Text.normH5.copyWith(color: style.GrayColor.black),
                isExpanded: true,
                autofocus: true,
                borderRadius: BorderRadius.all(
                    Radius.circular(Layout.commonBorderRadius)),
                underline: Container(),
                iconEnabledColor: color,
                focusColor: Colors.transparent,
              ),
            ),
            Icon(
              Icons.arrow_drop_down_rounded,
              color: color,
              size: Layout.iconSize,
            ),
          ],
        ));
  }
}
