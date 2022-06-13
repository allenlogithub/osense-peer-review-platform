import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:peerrev/widget/roundedBox.dart';
import 'package:peerrev/util/layout.dart' as layout;
import 'package:peerrev/widget/scoreIndicator.dart';
import 'package:peerrev/widget/selectForm.dart';
import 'package:peerrev/util/style.dart' as style;
import 'package:peerrev/widget/button.dart';
import 'package:peerrev/bloc/reviewEditor.dart/revieweditor_bloc.dart';
import 'package:peerrev/data/repo/staffQ.dart';
import 'package:peerrev/widget/tag.dart';
import 'package:peerrev/widget/staff/reviewedList.dart';

class StaffReviewEditor extends StatelessWidget {
  final int editBtnIdx;
  const StaffReviewEditor({
    Key? key,
    required this.editBtnIdx,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> q = [];
    var ans = {'dept': '', 'coop': '', 'resp': []};

    for (int i = 1; i < StaffQ.data.length; i++) {
      if (StaffQ.data[i]['typeId'] == 1) {
        q.add(QType1(
          content: StaffQ.data[i]['content'].toString(),
          index: i,
          tag: StaffQ.data[i]['tag'].toString(),
          ans: ans,
        ));
      } else if (StaffQ.data[i]['typeId'] == 2) {
        q.add(QType2(
          content: StaffQ.data[i]['content'].toString(),
          index: i,
          tag: StaffQ.data[i]['tag'].toString(),
          ans: ans,
        ));
      }
    }

    return RoundedBox(
      toTop: layout.Size.blockSizeVertical * 3,
      toBottom: layout.Size.blockSizeVertical * 4,
      toLeft: layout.Size.blockSizeHorizontal * 8,
      color: style.ThemeColor.bgPrimary,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Selection,
            for (Widget item in q) item,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                    color: style.StatusColor.success,
                    text: '確認',
                    callback: () => _confirmCallback(context),
                    isFilled: false),
                SizedBox(width: layout.Size.blockSizeHorizontal),
                Button(
                    color: style.StatusColor.error,
                    text: '取消',
                    callback: () => _cancelCallback(context),
                    isFilled: false),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget CoopDept = RoundedBox(
    toTop: layout.Size.blockSizeVertical * 3,
    toBottom: layout.Size.blockSizeVertical,
    toLeft: layout.Size.blockSizeHorizontal * 2,
    child: Padding(
      padding: EdgeInsets.only(
        left: layout.Size.blockSizeHorizontal,
        right: layout.Size.blockSizeHorizontal * 3,
        top: layout.Size.blockSizeVertical * 2,
        bottom: layout.Size.blockSizeVertical * 2,
      ),
      child: SizedBox(
          height: layout.Size.blockSizeVertical * 10,
          child: Column(
            children: [
              Text('合作部門', style: style.Text.normH4),
              Expanded(
                  child: SelectForm(
                      items: ["1", "2", "3"],
                      selected: "1",
                      callback: (_selected) => _coopDeptCallback(),
                      color: Colors.black)),
            ],
          )),
    ));

void _coopDeptCallback() {
  print('_coopDeptCallback');
}

Widget CoopPerson = RoundedBox(
    toTop: layout.Size.blockSizeVertical * 3,
    toBottom: layout.Size.blockSizeVertical,
    toRight: layout.Size.blockSizeHorizontal * 2,
    child: Padding(
      padding: EdgeInsets.only(
        left: layout.Size.blockSizeHorizontal,
        right: layout.Size.blockSizeHorizontal * 3,
        top: layout.Size.blockSizeVertical * 2,
        bottom: layout.Size.blockSizeVertical * 2,
      ),
      child: SizedBox(
          height: layout.Size.blockSizeVertical * 10,
          child: Column(
            children: [
              Text('合作對象', style: style.Text.normH4),
              Expanded(
                  child: SelectForm(
                      items: ["a", "b", "c"],
                      selected: "a",
                      callback: (_selected) => _coopPersonCallback(),
                      color: Colors.black)),
            ],
          )),
    ));

void _coopPersonCallback() {
  print('_coopPersonCallback');
}

Widget Selection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Expanded(child: CoopDept),
    SizedBox(width: layout.Size.blockSizeHorizontal),
    Expanded(child: CoopPerson),
  ],
);

class ScoreIndicators extends StatelessWidget {
  final String tag;

  const ScoreIndicators({
    Key? key,
    required this.tag,
  }) : super(key: key);
  Widget build(BuildContext context) {
    List<Widget> _indicators = [];
    for (int i = 1; i < 6; i++) {
      _indicators.add(
        InkWell(
          child: ScoreIndicator(
              color: style.GrayColor.grey,
              bgColor: style.GrayColor.light,
              radius: layout.Size.blockSize * 5,
              width: layout.Size.blockSize,
              value: i.toDouble(),
              maximum: 5),
          onTap: () => {
            print('pressed on tag: ' + tag + ' score: ' + i.toString()),
          },
        ),
      );

      _indicators.add(SizedBox(width: layout.Size.blockSizeHorizontal));
    }

    return Row(children: _indicators);
  }
}

class QType1 extends StatelessWidget {
  final String content;
  final String tag;
  final int index;
  final Map ans;
  const QType1({
    Key? key,
    required this.content,
    required this.tag,
    required this.index,
    required this.ans,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
        toTop: layout.Size.blockSizeVertical * 3,
        toBottom: layout.Size.blockSizeVertical,
        toRight: layout.Size.blockSizeHorizontal * 2,
        toLeft: layout.Size.blockSizeHorizontal * 2,
        child: Padding(
          padding: EdgeInsets.only(
            left: layout.Size.blockSizeHorizontal,
            right: layout.Size.blockSizeHorizontal * 3,
            top: layout.Size.blockSizeVertical * 2,
            bottom: layout.Size.blockSizeVertical * 2,
          ),
          child: Row(
            children: [
              SizedBox(width: layout.Size.blockSizeHorizontal * 2),
              Expanded(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Text(content, style: style.Text.normH4),
                      SizedBox(width: layout.Size.blockSizeHorizontal),
                      Tag(color: ColorList.colorList[index], text: tag),
                    ],
                  ),
                  SizedBox(height: layout.Size.blockSizeVertical),
                  ScoreIndicators(tag: tag),
                ],
              )),
              SizedBox(width: layout.Size.blockSizeHorizontal * 8),
            ],
          ),
        ));
  }
}

class QType2 extends StatelessWidget {
  final String content;
  final String tag;
  final int index;
  final Map ans;
  const QType2({
    Key? key,
    required this.content,
    required this.tag,
    required this.index,
    required this.ans,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
        toTop: layout.Size.blockSizeVertical * 3,
        toBottom: layout.Size.blockSizeVertical,
        toRight: layout.Size.blockSizeHorizontal * 2,
        toLeft: layout.Size.blockSizeHorizontal * 2,
        child: Padding(
          padding: EdgeInsets.only(
            left: layout.Size.blockSizeHorizontal,
            right: layout.Size.blockSizeHorizontal * 3,
            top: layout.Size.blockSizeVertical * 2,
            bottom: layout.Size.blockSizeVertical * 2,
          ),
          child: Row(
            children: [
              SizedBox(width: layout.Size.blockSizeHorizontal * 2),
              Expanded(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Text(content, style: style.Text.normH4),
                      SizedBox(width: layout.Size.blockSizeHorizontal),
                      Tag(color: ColorList.colorList[index], text: tag),
                    ],
                  ),
                  SizedBox(height: layout.Size.blockSizeVertical),
                  ScoreIndicators(tag: tag),
                ],
              )),
              SizedBox(width: layout.Size.blockSizeHorizontal * 8),
            ],
          ),
        ));
  }
}

void _confirmCallback(BuildContext context) {
  print('operation confirmed');
  context.read<RevieweditorBloc>().add(RevieweditorVisibilitySwitchedEvent());
}

void _cancelCallback(BuildContext context) {
  print('operation canceled');
  context.read<RevieweditorBloc>().add(RevieweditorVisibilitySwitchedEvent());
}
