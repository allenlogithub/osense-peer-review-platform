import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:peerrev/data/repo/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;

  AuthBloc({required this.authRepo}) : super(UnAuthenticated()) {
    on<GoogleSignInRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepo.signInWithGoogle();
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<GoogleSignOutRequested>((event, emit) async {
      emit(Loading());
      await authRepo.signOut();
      emit(UnAuthenticated());
    });
  }
}
