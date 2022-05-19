import 'package:flutter/material.dart';

import 'package:peerrev/widget/button.dart';
import 'package:peerrev/widget/textForm.dart';
import 'package:peerrev/widget/selectForm.dart';
import 'package:peerrev/util/layout.dart';
import 'package:peerrev/util/style.dart' as style;

class WidgetListPage extends StatefulWidget {
  const WidgetListPage({Key? key}) : super(key: key);

  @override
  _WidgetListPageState createState() => _WidgetListPageState();
}

class _WidgetListPageState extends State<WidgetListPage> {
  late TextEditingController _controller1, _controller2, _controller3;
  final List<dynamic> _items = [1, 'a', '#', 4, 'b', 'c', 'd'];
  late dynamic _selected = 1;

  void func(int num) {
    print(num);
  }

  void func2(String s) {
    print(s);
  }

  void func3(String s, t) {
    print(s + ' & ' + t);
  }

  void func4(dynamic s) {
    setState(() {
      _selected = s;
    });
    print(_selected);
  }

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
    _controller3 = TextEditingController();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
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
            Column(
              children: [
                TextForm(
                  controller: _controller1,
                  color: style.ThemeColor.primary,
                  helperText: 'message: msgmsgmsgmsgmsgmsgmsgmsg',
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Button(
                  color: Colors.amber,
                  text: 'Submit',
                  callback: () => func2(_controller1.text),
                  icon: Icons.baby_changing_station_sharp,
                  isFilled: true,
                ),
              ],
            ),
            Column(
              children: [
                TextForm(
                  controller: _controller2,
                  color: style.ThemeColor.primary,
                  labelText: 'label',
                  helperText: 'message: msgmsgmsgmsgmsgmsgmsgmsg',
                  helperMaxLines: 1,
                ),
                const Spacer(),
                TextForm(
                  controller: _controller3,
                  color: style.ThemeColor.primary,
                  icon: Icons.abc,
                ),
                const Spacer(),
                Button(
                  color: Colors.amber,
                  text: 'Submit',
                  callback: () => func3(_controller2.text, _controller3.text),
                  icon: Icons.baby_changing_station_sharp,
                  isFilled: true,
                ),
              ],
            ),
            SelectForm(
              items: _items,
              selected: _selected,
              callback: (_selected) => func4(_selected),
              color: style.ThemeColor.primary,
              icon: Icons.access_alarm,
            ),
          ],
        ),
      ),
    );
  }
}
