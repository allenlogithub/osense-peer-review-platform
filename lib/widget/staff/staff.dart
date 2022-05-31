import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:peerrev/util/style.dart' as style;
import 'package:peerrev/util/layout.dart';
import 'package:peerrev/widget/staff/reviewedList.dart';
import 'package:peerrev/bloc/staffPanel/staffpanel_bloc.dart';
import 'package:peerrev/widget/roundedBox.dart';

class StaffPanel extends StatelessWidget {
  final bool isReviewListVisible;
  StaffPanel({Key? key, required this.isReviewListVisible}) : super(key: key);

  final color = style.ThemeColor.primary;
  final bgColor = style.ThemeColor.bgPrimary;
  final commonBorderRadius = Layout.commonBorderRadius;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StaffpanelBloc, bool>(builder: (context, state) {
      bool isVisible = state;

      return RoundedBox(
        toTop: 32.0,
        toBottom: 32.0,
        toLeft: 148.0,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(Layout.commonBorderRadius),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width - 148.0,
          height: MediaQuery.of(context).size.height - 64.0,
          color: style.GrayColor.white,
          child: Stack(
            children: [
              Visibility(child: ReviewList(), visible: isVisible),
            ],
          ),
        ),
      );
    });
  }
}
