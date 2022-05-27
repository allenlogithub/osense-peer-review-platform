import 'package:flutter/material.dart';

import 'package:peerrev/page/widget-list.dart';
import 'package:peerrev/page/signIn.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/widgetList': (context) => const WidgetListPage(),
  '/login': (context) => const SignIn(),
};
