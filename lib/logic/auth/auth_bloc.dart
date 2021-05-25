import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pricer_project/data/repositories/user_repositories.dart';
import 'package:pricer_project/services/service_session_manager.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;
  AuthBloc({required this.userRepository}) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppLoaded) {
      yield* _mapAppLoadedToState(event);
    }

    if (event is UserLoggedIn) {
      yield* _mapUserLoggedInToState(event);
    }

    if (event is UserLoggedOut) {
      yield* _mapUserLoggedOutToState(event);
    }
  }

  Stream<AuthState> _mapAppLoadedToState(AppLoaded event) async* {
    yield AuthLoading();

    try {
      final String currentUserEmail = await SessionManagerService().getUser();
      // ignore: unnecessary_null_comparison
      if (currentUserEmail != null) {
        yield AuthAuthenticated(userEmail: currentUserEmail);
      } else {
        yield AuthNotAuthenticated();
      }
    } catch (e) {
      yield AuthFailure(message: 'An unknown error occurred when auth');
      yield AuthNotAuthenticated();
    }
  }

  Stream<AuthState> _mapUserLoggedInToState(UserLoggedIn event) async* {
    yield AuthAuthenticated(userEmail: event.userEmail);
  }

  Stream<AuthState> _mapUserLoggedOutToState(UserLoggedOut event) async* {
    // await adminRepository.logOutAdmin();
    yield AuthNotAuthenticated();
  }
}
