import 'package:flutter/material.dart';

import 'package:peerrev/page/home.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (context) => HomePage(),
};
