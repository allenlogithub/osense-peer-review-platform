import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:peerrev/bloc/auth/auth_bloc.dart';
import 'package:peerrev/page/main.dart';
import 'package:peerrev/bloc/naviDrawer/navidrawer_bloc.dart';
import 'package:peerrev/data/repo/auth.dart';
import 'package:peerrev/bloc/staffPanel/staffpanel_bloc.dart';
import 'package:peerrev/data/repo/reviewedScore.dart';
import 'package:peerrev/util/layout.dart' as layout;
import 'package:peerrev/bloc/reviewEditor.dart/revieweditor_bloc.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    layout.Size().init(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("SignIn"),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider<NavidrawerBloc>(
                        create: (BuildContext context) => NavidrawerBloc(),
                      ),
                      BlocProvider<AuthBloc>(
                        create: (context) => AuthBloc(
                          authRepo: RepositoryProvider.of<AuthRepo>(context),
                        ),
                      ),
                      BlocProvider<StaffpanelBloc>(
                        create: (context) =>
                            StaffpanelBloc(reviewedScore: ReviewedScore()),
                      ),
                      BlocProvider<RevieweditorBloc>(
                          create: (context) => RevieweditorBloc()),
                    ],
                    child: const MainPage(),
                  );
                },
              ),
            );
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UnAuthenticated) {
              return Center(
                  child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () {
                    _authenticateWithGoogle(context);
                  },
                  child: const Text('Sign In'),
                ),
              ));
            }
            return Container();
          },
        ),
      ),
    );
  }

  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }
}
