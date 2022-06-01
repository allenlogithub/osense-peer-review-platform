import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:peerrev/widget/drawer/naviDrawerItem.dart';
import 'package:peerrev/widget/drawer/naviDrawerModel.dart';
import 'package:peerrev/bloc/naviDrawer/navidrawer_bloc.dart';
import 'package:peerrev/util/layout.dart' as layout;
import 'package:peerrev/util/style.dart' as style;
import 'package:peerrev/bloc/staffPanel/staffpanel_bloc.dart';

class NavigationDrawer extends StatelessWidget {
  final color = style.ThemeColor.primary;
  final bgColor = style.ThemeColor.bgPrimary;
  final commonBorderRadius = layout.Layout.commonBorderRadius;

  @override
  Widget build(BuildContext context) {
    final safeArea =
        EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top);

    return BlocBuilder<NavidrawerBloc, bool>(builder: (context, state) {
      bool isCollapsed = state;

      return Container(
        width: isCollapsed ? layout.Size.blockSizeHorizontal * 6 : null,
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(commonBorderRadius),
            bottom: Radius.circular(commonBorderRadius),
          ),
          child: Drawer(
            child: Container(
              color: bgColor,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                            vertical: layout.Size.blockSizeVertical * 4)
                        .add(safeArea),
                    color: Colors.white12,
                    child: buildHeader(context, isCollapsed),
                  ),
                  Divider(color: color),
                  SizedBox(height: layout.Size.blockSizeVertical * 4),
                  buildList(items: itemsFirst, isCollapsed: isCollapsed),
                  SizedBox(height: layout.Layout.drawerIconInterval),
                  Divider(color: color),
                  SizedBox(height: layout.Layout.drawerIconInterval),
                  buildList(
                    indexOffset: itemsFirst.length,
                    items: itemsSecond,
                    isCollapsed: isCollapsed,
                  ),
                  const Spacer(),
                  buildCollapseIcon(context, isCollapsed),
                  SizedBox(height: layout.Size.blockSizeVertical),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget buildList({
    required bool isCollapsed,
    required List<DrawerItem> items,
    int indexOffset = 0,
  }) =>
      ListView.separated(
        padding: isCollapsed
            ? EdgeInsets.zero
            : EdgeInsets.symmetric(
                horizontal: layout.Size.blockSizeHorizontal * 1),
        shrinkWrap: true,
        primary: false,
        itemCount: items.length,
        separatorBuilder: (context, index) =>
            SizedBox(height: layout.Size.blockSizeVertical * 1),
        itemBuilder: (context, index) {
          final item = items[index];

          return buildMenuItem(
            isCollapsed: isCollapsed,
            text: item.title,
            icon: item.icon,
            onClicked: () => selectItem(context, indexOffset + index),
          );
        },
      );

  void selectItem(BuildContext context, int index) {
    // final navigateTo = (page) => Navigator.of(context).push(MaterialPageRoute(
    //       builder: (context) => page,
    //     ));

    // Navigator.of(context).pop();

    switch (index) {
      case 0:
        print(0);
        // navigateTo(GetStartedPage());
        context.read<StaffpanelBloc>().add(PanelVisibilitySwitchedEvent());
        break;
      case 1:
        print(1);
        // navigateTo(SamplesPage());
        break;
      case 2:
        print(2);
        // navigateTo(TestingPage());
        break;
      case 3:
        print(3);
        // navigateTo(PerformancePage());
        break;
      case 4:
        // navigateTo(DeploymentPage());
        break;
      case 5:
        // navigateTo(ResourcesPage());
        break;
    }
  }

  Widget buildMenuItem({
    required bool isCollapsed,
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = style.ThemeColor.primary;
    final leading = Icon(
      icon,
      color: color,
      size: layout.Size.blockSize * 3,
    );

    return Material(
      color: Colors.transparent,
      child: isCollapsed
          ? ListTile(
              title: leading,
              onTap: onClicked,
            )
          : ListTile(
              leading: leading,
              title: Text(text, style: TextStyle(color: color, fontSize: 16)),
              onTap: onClicked,
            ),
    );
  }

  Widget buildCollapseIcon(BuildContext context, bool isCollapsed) {
    final double size = layout.Size.blockSize * 5;
    final icon = isCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios;
    final alignment = isCollapsed ? Alignment.center : Alignment.centerRight;
    final margin = isCollapsed
        ? null
        : EdgeInsets.only(right: layout.Size.blockSizeHorizontal * 2);
    final width = isCollapsed ? double.infinity : size;

    return Container(
      alignment: alignment,
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            width: width,
            height: size,
            child: Icon(icon, color: color),
          ),
          onTap: () {
            context.read<NavidrawerBloc>().add(NavidrawerSwitchedEvent());
          },
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context, bool isCollapsed) {
    final user = FirebaseAuth.instance.currentUser!;
    final name = user.displayName;
    final img = Image.network(user.photoURL!);
    final email = user.email;

    if (isCollapsed) {
      return Row(
        children: [
          SizedBox(width: layout.Size.blockSizeHorizontal * 1),
          Center(
            child: SizedBox(
              child: img != null ? img : Icon(Icons.person),
              width: layout.Size.blockSize * 7,
              height: layout.Size.blockSize * 12,
            ),
          ),
          SizedBox(width: layout.Size.blockSizeHorizontal * 1),
        ],
      );
    } else {
      return Row(
        children: [
          SizedBox(width: layout.Size.blockSizeHorizontal * 1),
          Center(
            child: SizedBox(
              child: img != null ? img : Icon(Icons.person),
              width: layout.Size.blockSize * 7,
              height: layout.Size.blockSize * 12,
            ),
          ),
          SizedBox(width: layout.Size.blockSizeHorizontal * 1),
          if (name != null) ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.toString(),
                  style: style.Text.boldH3.copyWith(),
                ),
                Text(
                  'NAPICall',
                  style: style.Text.normH5.copyWith(),
                ),
                Text(
                  email.toString(),
                  style: style.Text.normH6.copyWith(),
                  overflow: TextOverflow.fade,
                ),
              ],
            ),
          ] else ...[
            const Text(
              'Incognito',
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
          ],
        ],
      );
    }
  }
}
