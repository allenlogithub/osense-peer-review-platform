import 'package:flutter/material.dart';

import 'package:peerrev/util/style.dart' as style;

class Tag extends StatelessWidget {
  final Color color;
  final String text;
  const Tag({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
      child: Text(
        text,
        style: style.Text.normH5.copyWith(color: style.GrayColor.white),
      ),
      color: color,
    );
  }
}
