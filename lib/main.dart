import 'package:flutter/material.dart';

import 'package:peerrev/env/envConfig.dart';
import 'package:peerrev/util/router.dart';
import 'package:peerrev/page/splash.dart';
// import 'package:peerrev/page/home.dart';
import 'package:peerrev/page/refresh.dart';
import 'package:peerrev/page/login.dart';

void main() => runApp(InitializationApp());

class InitializationApp extends StatelessWidget {
  final Future _initServicesFuture = Init().initServices();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: appRoutes,
      title: 'Osense Peer Review System Initialization',
      home: FutureBuilder(
        future: _initServicesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == true) {
              // return HomePage();
              return SignInPage();
            } else {
              return RefreshPage();
            }
          } else {
            return SplashPage();
          }
        },
      ),
    );
  }
}
