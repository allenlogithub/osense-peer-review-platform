import 'package:flutter/material.dart';

import 'package:peerrev/widget/button.dart';
import 'package:peerrev/util/layout.dart';
import 'package:peerrev/util/style.dart' as style;

class WidgetListPage extends StatelessWidget {
  const WidgetListPage({Key? key}) : super(key: key);

  void func(int num) {
    print(num);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget List'),
      ),
      body: Container(
        padding: EdgeInsets.all(Layout.commonPadding),
        child: GridView.count(
          crossAxisCount: 7,
          mainAxisSpacing: Layout.mainAxisSpacing,
          crossAxisSpacing: Layout.crossAxisSpacing,
          children: [
            Button(
              color: style.ThemeColor.primary,
              text: '1',
              callback: () => func(1),
              icon: Icons.ac_unit,
              isFilled: true,
            ),
            Button(
              color: style.ThemeColor.primary,
              text: '2',
              callback: () => func(2),
              icon: Icons.ac_unit,
              isFilled: false,
            ),
            Button(
              color: style.ThemeColor.primary,
              text: '3',
              callback: () => func(3),
              isFilled: false,
            ),
            Button(
              color: Colors.amber,
              text: '4',
              callback: () => func(4),
              isFilled: false,
            ),
            Button(
              color: Colors.amber,
              text: '5',
              callback: () => func(5),
              icon: Icons.baby_changing_station_sharp,
              isFilled: true,
            ),
          ],
        ),
      ),
    );
  }
}
