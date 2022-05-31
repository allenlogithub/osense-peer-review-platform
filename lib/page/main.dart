import 'package:flutter/material.dart';

import 'package:peerrev/widget/drawer/naviDrawer.dart';
import 'package:peerrev/widget/staff/staff.dart';
import 'package:peerrev/util/style.dart' as style;

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.ThemeColor.primary,
      body: Stack(
        children: [
          Row(
            children: [
              StaffPanel(
                isReviewListVisible: false,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50, top: 50, left: 32),
            child: NavigationDrawer(),
          ),
        ],
      ),
    );
  }
}
