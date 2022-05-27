import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:peerrev/widget/drawer/naviDrawerItem.dart';
import 'package:peerrev/widget/drawer/naviDrawerModel.dart';
import 'package:peerrev/bloc/naviDrawer/navidrawer_bloc.dart';
import 'package:peerrev/util/layout.dart';
import 'package:peerrev/util/style.dart' as style;

class NavigationDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  final color = style.ThemeColor.primary;
  final bgColor = style.ThemeColor.bgPrimary;
  final commonBorderRadius = Layout.commonBorderRadius;

  @override
  Widget build(BuildContext context) {
    final safeArea =
        EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top);

    return BlocBuilder<NavidrawerBloc, bool>(builder: (context, state) {
      bool isCollapsed = state;

      return Container(
        // width: isCollapsed ? MediaQuery.of(context).size.width * 0.05 : null,
        width: isCollapsed ? 102 : null,
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
                  // SizedBox(height: 32.0),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 32.0).add(safeArea),
                    width: double.infinity,
                    color: Colors.white12,
                    child: buildHeader(context, isCollapsed),
                  ),
                  // SizedBox(height: 32.0),
                  Divider(color: color),
                  SizedBox(height: 32.0),
                  buildList(items: itemsFirst, isCollapsed: isCollapsed),
                  SizedBox(height: Layout.drawerIconInterval),
                  Divider(color: color),
                  SizedBox(height: Layout.drawerIconInterval),
                  buildList(
                    indexOffset: itemsFirst.length,
                    items: itemsSecond,
                    isCollapsed: isCollapsed,
                  ),
                  const Spacer(),
                  buildCollapseIcon(context, isCollapsed),
                  const SizedBox(height: 12),
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
        padding: isCollapsed ? EdgeInsets.zero : padding,
        shrinkWrap: true,
        primary: false,
        itemCount: items.length,
        separatorBuilder: (context, index) => SizedBox(height: 16),
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
    final leading = Icon(icon, color: color);

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
    final double size = 52;
    final icon = isCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios;
    final alignment = isCollapsed ? Alignment.center : Alignment.centerRight;
    final margin = isCollapsed ? null : EdgeInsets.only(right: 16);
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
          SizedBox(width: 16),
          SizedBox(
            child: img != null ? img : Icon(Icons.person),
            width: 70.0,
          ),
          SizedBox(width: 16),
        ],
      );
    } else {
      return Row(
        children: [
          SizedBox(width: 16),
          SizedBox(
            child: img != null ? img : Icon(Icons.person),
            width: 70.0,
          ),
          SizedBox(width: 16),
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
                  style: style.Text.normH6.copyWith(),
                ),
                Text(
                  email.toString(),
                  style: style.Text.normH6.copyWith(),
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
