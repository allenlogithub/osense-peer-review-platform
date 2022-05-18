import 'package:flutter/material.dart';
// import 'package:peerrev/main.dart';
import 'package:peerrev/page/home.dart';
import 'package:peerrev/page/widget-list.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/main': (context) => HomePage(),
  '/widgetList': (context) => const WidgetListPage(),
  // '/': (context) => InitializationApp(),
};
