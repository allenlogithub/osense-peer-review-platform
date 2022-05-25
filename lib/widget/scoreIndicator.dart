import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:peerrev/util/style.dart' as style;

class ScoreIndicator extends StatelessWidget {
  final Color color;
  final Color bgColor;
  final double value;
  final double maximum;
  final double radius;
  final double width;

  const ScoreIndicator({
    Key? key,
    required this.color,
    required this.bgColor,
    required this.radius,
    required this.width,
    required this.value,
    required this.maximum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: radius,
      lineWidth: width,
      percent: value / maximum,
      center: Text(
        value.toString(),
        style: style.Text.normH5.copyWith(color: color),
      ),
      backgroundColor: bgColor,
      progressColor: color,
    );
  }
}
