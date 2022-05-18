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
          crossAxisCount: 2,
          mainAxisSpacing: Layout.mainAxisSpacing,
          crossAxisSpacing: Layout.crossAxisSpacing,
          children: [
            Button(
              backgroundColor: style.ThemeColor.primary,
              foregroundColor: style.GrayColor.white,
              borderColor: style.ThemeColor.primary,
              text: '1',
              callback: () => func(1),
              icon: Icons.ac_unit,
              inverse: true,
            ),
            Button(
              backgroundColor: style.GrayColor.white,
              foregroundColor: style.ThemeColor.primary,
              borderColor: style.ThemeColor.primary,
              text: '2',
              callback: () => func(2),
              icon: Icons.ac_unit,
              inverse: false,
            ),
          ],
        ),
      ),
    );
  }
}
