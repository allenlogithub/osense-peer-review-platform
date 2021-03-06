import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:peerrev/util/formatChange.dart';
import 'package:peerrev/widget/button.dart';
import 'package:peerrev/widget/textForm.dart';
import 'package:peerrev/widget/selectForm.dart';
import 'package:peerrev/util/layout.dart';
import 'package:peerrev/util/style.dart' as style;
import 'package:peerrev/widget/dateForm.dart';
import 'package:peerrev/util/formatCheck.dart';
import 'package:peerrev/widget/timeForm.dart';
import 'package:peerrev/widget/numberForm.dart';
import 'package:peerrev/widget/toast.dart' as t;
import 'package:peerrev/widget/scoreIndicator.dart';

class WidgetListPage extends StatefulWidget {
  const WidgetListPage({Key? key}) : super(key: key);

  @override
  _WidgetListPageState createState() => _WidgetListPageState();
}

class _WidgetListPageState extends State<WidgetListPage> {
  late TextEditingController _controller1,
      _controller2,
      _controller3,
      _controller4,
      _controller5,
      _controller6,
      _controller7;
  final List<dynamic> _items = [1, 'a', '#', 4, 'b', 'c', 'd'];
  late dynamic _selected = 1;
  late FToast fToast;

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

  void func5(String s) {
    setState(() {
      _controller5.text = s;
    });
    print(s);
  }

  void func6(String s, format) {
    if (FormatCheck.isTime(s, format)) {
      String d = FormatChange.getFormattedTimeString(s, format);
      print(d);
      print('pass');
    } else {
      print('invalid');
    }
  }

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
    _controller3 = TextEditingController();
    _controller4 = TextEditingController();
    _controller5 = TextEditingController();
    _controller6 = TextEditingController();
    _controller7 = TextEditingController();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    _controller7.dispose();
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
          crossAxisCount: 5,
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
            Column(
              children: [
                Button(
                  color: style.ThemeColor.primary,
                  text: '2',
                  callback: () => func(2),
                  icon: Icons.ac_unit,
                  isFilled: false,
                ),
              ],
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
            SelectForm(
              items: _items,
              selected: _selected,
              callback: (_selected) => func4(_selected),
              color: style.ThemeColor.primary,
            ),
            Column(
              children: [
                TextForm(
                  color: style.ThemeColor.primary,
                  controller: _controller4,
                  maxLines: 5,
                  helperText: '123',
                  icon: Icons.ac_unit,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Button(
                  color: Colors.amber,
                  text: 'Submit',
                  callback: () => func2(_controller4.text),
                  icon: Icons.baby_changing_station_sharp,
                  isFilled: true,
                ),
              ],
            ),
            Column(
              children: [
                DateForm(
                  color: style.ThemeColor.primary,
                  controller: _controller5,
                  icon: Icons.accessible,
                  helperText: 'tttt',
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Button(
                  color: Colors.amber,
                  text: 'Submit',
                  callback: () => func6(_controller5.text, 'yyyy/MM/dd'),
                  icon: Icons.baby_changing_station_sharp,
                  isFilled: true,
                ),
                DateForm(
                  color: style.ThemeColor.primary,
                  controller: _controller5,
                  helperText: 'tttt',
                ),
              ],
            ),
            Column(
              children: [
                TimeForm(
                  color: style.ThemeColor.primary,
                  controller: _controller6,
                  icon: Icons.ac_unit,
                  helperText: 'mmmmm',
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Button(
                  color: Colors.amber,
                  text: 'Submit',
                  callback: () => func6(_controller6.text, 'HH:mm'),
                  icon: Icons.baby_changing_station_sharp,
                  isFilled: true,
                ),
                TimeForm(
                  color: style.ThemeColor.primary,
                  controller: _controller6,
                  helperText: 'mmmmm',
                ),
              ],
            ),
            Column(
              children: [
                NumberForm(
                  controller: _controller7,
                  color: style.ThemeColor.primary,
                ),
                NumberForm(
                  controller: _controller7,
                  color: style.ThemeColor.primary,
                  icon: Icons.zoom_out_sharp,
                  helperText: '1234567890123456789012345678901234567890',
                )
              ],
            ),
            Column(
              children: [
                Button(
                  color: Colors.amber,
                  text: 'Error Toast',
                  callback: () => t.Toast(
                    text: 'Error Error Error Error Error Error',
                    color: style.StatusColor.error,
                    bgColor: style.StatusColor.bgError,
                    icon: Icons.error,
                  ).showToast(fToast),
                  icon: Icons.add,
                  isFilled: true,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Button(
                  color: Colors.amber,
                  text: 'Success Toast',
                  callback: () => t.Toast(
                    text: 'Success Success Success Success Success Success',
                    color: style.StatusColor.success,
                    bgColor: style.StatusColor.bgSuccess,
                    duration: 7,
                  ).showToast(fToast),
                  icon: Icons.remove,
                  isFilled: true,
                ),
              ],
            ),
            ScoreIndicator(
              color: style.StatusColor.error,
              bgColor: style.StatusColor.bgError,
              value: 4.0,
              maximum: 5.0,
              radius: 20,
              width: 5,
            ),
            ScoreIndicator(
              color: style.StatusColor.error,
              bgColor: style.StatusColor.bgError,
              value: 3.5,
              maximum: 5.0,
              radius: 20,
              width: 5,
            ),
          ],
        ),
      ),
    );
  }
}
