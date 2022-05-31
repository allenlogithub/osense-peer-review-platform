import 'package:flutter/material.dart';

import 'package:peerrev/util/layout.dart';

class RoundedBox extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? toLeft, toRight, toTop, toBottom;
  final BorderRadius? borderRadius;
  const RoundedBox({
    Key? key,
    required this.child,
    this.color,
    this.toLeft,
    this.toRight,
    this.toTop,
    this.toBottom,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: toTop ?? 0,
        bottom: toBottom ?? 0,
        left: toLeft ?? 0,
        right: toRight ?? 0,
      ),
      child: ClipRRect(
          borderRadius: borderRadius ??
              BorderRadius.all(
                Radius.circular(Layout.commonBorderRadius),
              ),
          child: Container(
            color: color ?? Colors.white,
            child: child,
          )),
    );
  }
}
