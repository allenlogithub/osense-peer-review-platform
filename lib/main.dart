import 'package:flutter/material.dart';

import 'package:peerrev/env/envConfig.dart';
import 'package:peerrev/util/router.dart';
import 'package:peerrev/page/splash.dart';
import 'package:peerrev/page/home.dart';

void main() => runApp(InitializationApp());

class InitializationApp extends StatelessWidget {
  final Future _initServicesFuture = Init.initServices();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: appRoutes,
      title: 'Initialization',
      home: FutureBuilder(
        future: _initServicesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return HomePage();
          } else {
            return SplashPage();
          }
        },
      ),
    );
  }
}
