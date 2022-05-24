import 'package:flutter/material.dart';

import 'package:peerrev/util/layout.dart';
import 'package:peerrev/util/style.dart' as style;
import 'package:peerrev/widget/exception.dart';

class TextForm extends StatelessWidget {
  final Color color;
  final IconData? icon;
  final String? labelText;
  final String? helperText;
  final int? maxLines;
  final TextEditingController controller;

  const TextForm({
    Key? key,
    required this.color,
    this.icon,
    this.labelText,
    this.helperText,
    this.maxLines,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isTextArea = (maxLines != null);

    if (isTextArea) {
      if (maxLines! <= 1) {
        throw InvalidInputException(
            'TextForm:consider the arg:maxLines to set as null or >1');
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(Layout.commonBorderRadius)),
            border: Border.all(
              color: color,
              width: Layout.commonBorderWidth,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller,
                          maxLines: maxLines ?? 1,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: labelText,
                            hintStyle: style.Text.normH5
                                .copyWith(color: style.GrayColor.grey),
                          ),
                          style: style.Text.normH5.copyWith(
                            color: style.GrayColor.black,
                          ),
                        ),
                      ),
                      if (!isTextArea) ...[
                        Container(
                          padding: EdgeInsets.only(
                            top: Layout.commonPadding / 2,
                            right: Layout.commonPadding,
                            bottom: Layout.commonPadding / 2,
                          ),
                          child: Icon(
                            icon,
                            color: color,
                            size: Layout.iconSize,
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (isTextArea) ...[
                    Positioned(
                      right: Layout.commonPadding / 2,
                      bottom: Layout.commonPadding / 2,
                      child: Icon(
                        icon,
                        color: color,
                        size: Layout.iconSize,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
        if (helperText != null) ...[
          Container(
            padding: EdgeInsets.only(
              top: Layout.widgetSpace,
            ),
            child: Text(
              helperText!,
              style: style.Text.normH5.copyWith(color: color),
            ),
          ),
        ],
      ],
    );
  }
}
