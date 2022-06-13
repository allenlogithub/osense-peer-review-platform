import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:peerrev/util/style.dart' as style;
import 'package:peerrev/util/layout.dart' as layout;
import 'package:peerrev/widget/staff/reviewedList.dart';
import 'package:peerrev/bloc/staffPanel/staffpanel_bloc.dart';
import 'package:peerrev/widget/roundedBox.dart';
import 'package:peerrev/widget/staff/edit.dart';
import 'package:peerrev/bloc/reviewEditor.dart/revieweditor_bloc.dart';

class StaffPanel extends StatelessWidget {
  final bool isReviewListVisible;
  StaffPanel({Key? key, required this.isReviewListVisible}) : super(key: key);

  final color = style.ThemeColor.primary;
  final bgColor = style.ThemeColor.bgPrimary;
  final commonBorderRadius = layout.Layout.commonBorderRadius;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StaffpanelBloc, bool>(builder: (context, state) {
      bool isReviewListVisible = state;

      return BlocBuilder<RevieweditorBloc, bool>(builder: ((context, state) {
        bool isReviewEditorVisible = state;

        return RoundedBox(
          toTop: layout.Size.blockSizeVertical * 3,
          toBottom: layout.Size.blockSizeVertical * 3,
          toLeft: layout.Size.blockSizeHorizontal *
              10, // 3 (page/main/padding) + 6 (page/drawer) + 1 (SPACE)
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(layout.Layout.commonBorderRadius),
          ),
          child: Container(
            width: layout.Size.blockSizeHorizontal * 90, // 100 - 10
            height: layout.Size.blockSizeVertical * 94, // 100 - 3*2
            color: style.GrayColor.white,
            child: Stack(
              children: [
                Visibility(child: ReviewList(), visible: isReviewListVisible),
                Visibility(
                    child: StaffReviewEditor(editBtnIdx: 1),
                    visible: isReviewEditorVisible),
              ],
            ),
          ),
        );
      }));
    });
  }
}
