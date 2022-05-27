import 'package:flutter/material.dart';

import 'package:peerrev/widget/drawer/naviDrawer.dart';
import 'package:peerrev/util/style.dart' as style;

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.ThemeColor.primary,
      body: Row(
        children: [
          const SizedBox(
            width: 20.0,
          ),
          Column(
            children: [
              const SizedBox(
                height: 50.0,
              ),
              Expanded(
                child: NavigationDrawer(),
              ),
              const SizedBox(
                height: 50.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
