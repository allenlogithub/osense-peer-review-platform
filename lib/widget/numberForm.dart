import 'package:flutter/material.dart';

import 'package:peerrev/util/style.dart' as style;
import 'package:peerrev/util/formatCheck.dart';
import 'package:peerrev/util/layout.dart';

class NumberForm extends StatelessWidget {
  final TextEditingController controller;
  final Color color;
  final String? helperText;
  final IconData? icon;

  const NumberForm({
    Key? key,
    required this.controller,
    required this.color,
    this.helperText,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.text = '3';
    int minimum = 1;
    int maximum = 5;

    void plus() {
      if (int.parse(controller.text) < maximum) {
        controller.text = (int.parse(controller.text) + 1).toString();
      }
    }

    void minus() {
      if (int.parse(controller.text) > minimum) {
        controller.text = (int.parse(controller.text) - 1).toString();
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(Layout.commonBorderRadius)),
                  border: Border.all(
                    color: color,
                    width: Layout.commonBorderWidth,
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.only(
                        left: Layout.commonPadding,
                        bottom: Layout.commonPadding,
                        top: Layout.commonPadding,
                      ),
                      onPressed: minus,
                      icon: Icon(
                        Icons.thumb_down_alt_rounded,
                        color: color,
                        size: Layout.iconSize,
                      ),
                    ),
                    Expanded(
                      child: FocusTraversalGroup(
                        child: Form(
                          autovalidateMode: AutovalidateMode.always,
                          child: TextFormField(
                            validator: (String? value) {
                              return (FormatCheck.isBetweenNumbers(
                                      controller.text, maximum, minimum))
                                  ? null
                                  : 'NumberForm:input num should between $minimum and $maximum';
                            },
                            controller: controller,
                            onSaved: (String? value) {},
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              hintText: '$minimum - $maximum',
                              hintStyle: style.Text.normH3
                                  .copyWith(color: style.GrayColor.grey),
                            ),
                            style: style.Text.normH3
                                .copyWith(color: style.GrayColor.black),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.only(
                        right: Layout.commonPadding,
                        bottom: Layout.commonPadding,
                        top: Layout.commonPadding,
                      ),
                      onPressed: plus,
                      icon: Icon(
                        Icons.thumb_up_rounded,
                        color: color,
                        size: Layout.iconSize,
                      ),
                    ),
                  ],
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
