import 'package:flutter/material.dart';

import 'package:peerrev/data/repo/reviewedScore.dart';
import 'package:peerrev/util/style.dart' as style;
import 'package:peerrev/widget/tag.dart';
import 'package:peerrev/widget/scoreIndicator.dart';
import 'package:peerrev/util/layout.dart';
import 'package:peerrev/widget/roundedBox.dart';

class ReviewList extends StatelessWidget {
  ReviewList({Key? key}) : super(key: key);

  var data = ReviewedScore.data;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    return RoundedBox(
      toTop: 70.0,
      toLeft: 32.0,
      toRight: 180.0,
      toBottom: 32.0,
      color: Colors.grey.shade200,
      child: Column(
        children: [
          RoundedBox(
            toTop: 70.0,
            toLeft: 32.0,
            toRight: 32.0,
            child: Container(
              height: 56.0,
              child: Row(
                children: [
                  // have no idea in adjusting the spaces cleverly
                  const SizedBox(width: 116.0),
                  Text('姓名', style: style.Text.boldH4),
                  const SizedBox(width: 80.0),
                  Text('部門', style: style.Text.boldH4),
                  const SizedBox(width: 80.0),
                  Expanded(
                      child: Center(
                    child: Text('評分', style: style.Text.boldH4),
                  )),
                  const SizedBox(width: 80.0),
                  Text('功能', style: style.Text.boldH4),
                  const SizedBox(width: 32),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  String name = data[index]['name'].toString();
                  String dept = data[index]['dept'].toString();
                  List<String> score = data[index]['score'] as List<String>;

                  return Container(
                    height: 120,
                    // width: 300,
                    width: MediaQuery.of(context).size.width, // - 425,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 116.0),
                        Text(name, style: style.Text.normH4),
                        const SizedBox(width: 80.0),
                        Tag(color: _deptColorMap.CMap[dept]!, text: dept),
                        // const SizedBox(width: 80.0),
                        Spacer(),
                        Expanded(
                          child: Center(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: score.length,
                              itemBuilder: (BuildContext context, int idx) {
                                return ScoreIndicator(
                                  color: _colorList.colorList[idx],
                                  bgColor: _colorList.bgColorList[idx],
                                  radius: 34.0,
                                  width: 8.5,
                                  value: double.parse(score[idx]),
                                  maximum: 5,
                                );
                              },
                            ),
                          ),
                        ),
                        Spacer(),
                        // const SizedBox(width: 80.0),
                        const _iconBtn(icon: Icons.edit, callback: _edit),
                        const SizedBox(width: 18.0),
                        const _iconBtn(icon: Icons.delete, callback: _delete),
                        const SizedBox(width: 32.0),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _delete() {
  print('delete');
}

void _edit() {
  print('edit');
}

class _iconBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback callback;
  const _iconBtn({
    Key? key,
    required this.icon,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: callback,
      icon: Icon(icon),
      color: Colors.grey.shade500,
      iconSize: 24.0,
    );
  }
}

class _deptColorMap {
  static var CMap = {
    'dept1': style.DeptColor.dept1,
    'dept2': style.DeptColor.dept2,
    'dept3': style.DeptColor.dept3,
    'dept4': style.DeptColor.dept4,
    'dept5': style.DeptColor.dept5,
    'dept6': style.DeptColor.dept6,
    'dept7': style.DeptColor.dept7,
  };
}

class _colorList {
  static var colorList = [
    const Color.fromRGBO(102, 180, 175, 1.0),
    const Color.fromRGBO(242, 166, 59, 1.0),
    const Color.fromRGBO(237, 116, 112, 1.0),
    const Color.fromRGBO(125, 193, 220, 1.0),
    const Color.fromRGBO(136, 136, 136, 1.0),
  ];
  static var bgColorList = [
    const Color.fromRGBO(102, 180, 175, 0.25),
    const Color.fromRGBO(242, 166, 59, 0.25),
    const Color.fromRGBO(237, 116, 112, 0.25),
    const Color.fromRGBO(125, 193, 220, 0.25),
    const Color.fromRGBO(136, 136, 136, 0.25),
  ];
}
