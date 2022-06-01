import 'package:flutter/material.dart';

import 'package:peerrev/widget/drawer/naviDrawer.dart';
import 'package:peerrev/widget/staff/staff.dart';
import 'package:peerrev/util/style.dart' as style;
import 'package:peerrev/util/layout.dart' as layout;

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
            padding: EdgeInsets.only(
              bottom: layout.Size.blockSizeVertical * 5,
              top: layout.Size.blockSizeVertical * 5,
              left: layout.Size.blockSizeHorizontal * 3,
            ),
            child: NavigationDrawer(),
          ),
        ],
      ),
    );
  }
}
