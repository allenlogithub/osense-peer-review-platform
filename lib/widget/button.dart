import 'package:flutter/material.dart';

import 'package:peerrev/util/layout.dart';
import 'package:peerrev/util/style.dart' as style;

class Button extends StatelessWidget {
  final Color color;
  final IconData? icon;
  final String text;
  final VoidCallback callback;
  final bool isFilled;
  const Button({
    Key? key,
    required this.color,
    required this.text,
    required this.callback,
    this.icon,
    required this.isFilled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => callback(),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: Layout.iconSize,
              ),
            ],
            Text(
              text,
              style: style.Text.normH4,
            ),
          ],
        ),
        padding: EdgeInsets.only(
          top: Layout.commonPadding / 2,
          bottom: Layout.commonPadding / 2,
          left: Layout.commonPadding / 2,
          right: Layout.commonPadding / 2,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: isFilled
            ? MaterialStateProperty.all<Color>(color)
            : MaterialStateProperty.all<Color>(Colors.white),
        foregroundColor: isFilled
            ? MaterialStateProperty.all<Color>(Colors.white)
            : MaterialStateProperty.all<Color>(color),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            width: Layout.commonBorderWidth,
            color: color,
          ),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Layout.commonBorderRadius),
          ),
        ),
      ),
    );
  }
}
