import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:peerrev/env/envConfig.dart';
import 'package:peerrev/page/signIn.dart';
import 'package:peerrev/bloc/auth/auth_bloc.dart';
import 'package:peerrev/data/repo/auth.dart';
import 'package:peerrev/firebase_options.dart';
import 'package:peerrev/util/router.dart';
import 'package:peerrev/page/refresh.dart';
import 'package:peerrev/page/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(App());
}

class App extends StatelessWidget {
  final Future _initServicesFuture = Init().initServices();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepo: RepositoryProvider.of<AuthRepo>(context),
            ),
          ),
        ],
        child: RepositoryProvider(
          create: (context) => AuthRepo(),
          child: BlocProvider(
            create: (context) => AuthBloc(
              authRepo: RepositoryProvider.of<AuthRepo>(context),
            ),
            child: MaterialApp(
              initialRoute: '/',
              routes: appRoutes,
              title: 'Osense Peer Review System Initialization',
              home: FutureBuilder(
                future: _initServicesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data == true) {
                      return const SignIn();
                    } else {
                      return const RefreshPage();
                    }
                  } else {
                    return const SplashPage();
                  }
                },
              ),
            ),
          ),
        ));
  }
}
