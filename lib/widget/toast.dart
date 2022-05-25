import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

import 'package:peerrev/util/layout.dart';
import 'package:peerrev/util/style.dart' as style;

class Toast {
  final String text;
  final IconData? icon;
  final Color color;
  final Color bgColor;
  final int? duration;

  Toast({
    this.icon,
    this.duration,
    required this.color,
    required this.bgColor,
    required this.text,
  });

  Widget toast() {
    return Container(
      padding: EdgeInsets.all(Layout.commonPadding),
      decoration: BoxDecoration(
        borderRadius: null,
        color: bgColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              this.icon,
              size: Layout.iconSize,
              color: color,
            ),
            SizedBox(
              width: Layout.widgetSpace,
            ),
          ],
          Text(this.text, style: style.Text.normH5.copyWith(color: color)),
        ],
      ),
    );
  }

  showToast(fToast) {
    fToast.showToast(
      child: toast(),
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: this.duration ?? 3),
    );
  }
}
