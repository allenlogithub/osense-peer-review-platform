import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:peerrev/data/repo/reviewedScore.dart';
import 'package:peerrev/util/style.dart' as style;
import 'package:peerrev/widget/tag.dart';
import 'package:peerrev/widget/scoreIndicator.dart';
import 'package:peerrev/util/layout.dart' as layout;
import 'package:peerrev/widget/roundedBox.dart';
import 'package:peerrev/bloc/reviewEditor.dart/revieweditor_bloc.dart';

class ReviewList extends StatelessWidget {
  ReviewList({Key? key}) : super(key: key);

  var data = ReviewedScore.data;
  final List<TableRow> _tableRows = [];
  final headRowSpacer = _rowSpacer(spaceUnit: 2);
  final rowSpacer = _rowSpacer();

  @override
  Widget build(BuildContext context) {
    _tableRows.add(
      TableRow(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(layout.Layout.commonBorderRadius)),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          color: Colors.white,
        ),
        children: [
          SizedBox(
              height: layout.Size.blockSizeVertical * 5,
              child: Center(
                  child: Text('姓名',
                      style: style.Text.boldH4, textAlign: TextAlign.center))),
          SizedBox(
              height: layout.Size.blockSizeVertical * 5,
              child: Center(
                  child: Text('部門',
                      style: style.Text.boldH4, textAlign: TextAlign.center))),
          SizedBox(
              height: layout.Size.blockSizeVertical * 5,
              child: Center(
                  child: Text('評分',
                      style: style.Text.boldH4, textAlign: TextAlign.center))),
          SizedBox(
              height: layout.Size.blockSizeVertical * 5,
              child: Center(
                  child: Text('功能',
                      style: style.Text.boldH4, textAlign: TextAlign.center))),
        ],
      ),
    );
    _tableRows.add(headRowSpacer);

    for (int i = 0; i < data.length; i++) {
      String name = data[i]['name'].toString();
      String dept = data[i]['dept'].toString();
      List<String> score = data[i]['score'] as List<String>;
      List<Widget> _socreIndicators = [];

      for (int j = 0; j < score.length; j++) {
        _socreIndicators.add(
          ScoreIndicator(
            color: ColorList.colorList[j],
            bgColor: ColorList.bgColorList[j],
            radius: layout.Size.blockSize * 3,
            width: layout.Size.blockSize,
            value: double.parse(score[j]),
            maximum: 5,
          ),
        );
        if (j != score.length - 1) {
          _socreIndicators
              .add(SizedBox(width: layout.Size.blockSizeHorizontal * 1));
        }
      }
      _tableRows.add(
        TableRow(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(layout.Layout.commonBorderRadius)),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            color: Colors.white,
          ),
          children: [
            SizedBox(
              child: Center(
                  child: Text(name,
                      style: style.Text.normH4, textAlign: TextAlign.center)),
              height: layout.Size.blockSizeVertical * 10,
            ),
            SizedBox(
              child: Center(
                  child: Center(
                      child:
                          Tag(color: _deptColorMap.CMap[dept]!, text: dept))),
              height: layout.Size.blockSizeVertical * 10,
            ),
            SizedBox(
              child: Center(
                  child: Center(
                      child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _socreIndicators,
              ))),
              height: layout.Size.blockSizeVertical * 10,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _iconBtn(icon: Icons.edit, callback: () => _edit(context)),
                  _iconBtn(icon: Icons.delete, callback: _delete),
                ],
              ),
              height: layout.Size.blockSizeVertical * 10,
            ),
          ],
        ),
      );
      if (i != score.length - 1) {
        _tableRows.add(rowSpacer);
      }
    }

    return RoundedBox(
        toTop: layout.Size.blockSizeVertical * 7,
        toLeft: layout.Size.blockSizeHorizontal * 3,
        toRight: layout.Size.blockSizeHorizontal * 12,
        toBottom: layout.Size.blockSizeVertical * 3,
        color: Colors.grey.shade200,
        child: Padding(
          padding: EdgeInsets.only(
            top: layout.Size.blockSizeVertical * 6,
            bottom: layout.Size.blockSizeVertical,
            left: layout.Size.blockSizeHorizontal * 2,
            right: layout.Size.blockSizeHorizontal * 2,
          ),
          child: Column(
            children: [
              Table(
                children: _tableRows,
                columnWidths: const {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(3),
                  2: FlexColumnWidth(9),
                  3: FlexColumnWidth(2),
                },
              ),
            ],
          ),
        ));
  }
}

void _delete() {
  print('delete');
}

void _edit(BuildContext context) {
  print('edit');
  context.read<RevieweditorBloc>().add(RevieweditorVisibilitySwitchedEvent());
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
      iconSize: layout.Size.blockSize * 2,
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

class ColorList {
  static var colorList = [
    const Color.fromRGBO(102, 180, 175, 1.0),
    const Color.fromRGBO(242, 166, 59, 1.0),
    const Color.fromRGBO(237, 116, 112, 1.0),
    const Color.fromRGBO(125, 193, 220, 1.0),
    const Color.fromRGBO(136, 136, 136, 1.0),
    const Color.fromRGBO(162, 206, 211, 1.0),
    const Color.fromRGBO(212, 179, 174, 1.0),
    const Color.fromRGBO(162, 20, 21, 1.0),
    const Color.fromRGBO(16, 206, 211, 1.0),
    const Color.fromRGBO(162, 206, 11, 1.0),
    const Color.fromRGBO(162, 26, 211, 1.0),
  ];
  static var bgColorList = [
    const Color.fromRGBO(102, 180, 175, 0.25),
    const Color.fromRGBO(242, 166, 59, 0.25),
    const Color.fromRGBO(237, 116, 112, 0.25),
    const Color.fromRGBO(125, 193, 220, 0.25),
    const Color.fromRGBO(136, 136, 136, 0.25),
  ];
}

final rowSpacer = TableRow(children: [
  SizedBox(
    height: layout.Size.blockSizeVertical,
  ),
  SizedBox(
    height: layout.Size.blockSizeVertical,
  ),
  SizedBox(
    height: layout.Size.blockSizeVertical,
  ),
  SizedBox(
    height: layout.Size.blockSizeVertical,
  ),
]);

TableRow _rowSpacer({spaceUnit = 1}) {
  return TableRow(children: [
    SizedBox(height: layout.Size.blockSizeVertical * spaceUnit),
    SizedBox(height: layout.Size.blockSizeVertical * spaceUnit),
    SizedBox(height: layout.Size.blockSizeVertical * spaceUnit),
    SizedBox(height: layout.Size.blockSizeVertical * spaceUnit),
  ]);
}
