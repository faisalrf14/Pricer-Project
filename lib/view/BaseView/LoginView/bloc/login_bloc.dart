import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pricer_project/data/repositories/user_repositories.dart';
import 'package:pricer_project/logic/auth/auth_bloc.dart';
import 'package:pricer_project/models/login_response.dart';
import 'package:pricer_project/models/register_response.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthBloc authBloc;

  LoginBloc({required this.userRepository, required this.authBloc})
      : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginAccount) {
      yield* _mapLoginAccountToState(event);
    }
    if (event is RegisterAccount) {
      yield* _mapRegisterAccountToState(event);
    }
  }

  Stream<LoginState> _mapLoginAccountToState(LoginAccount event) async* {
    yield LoginLoading();

    try {
      LoginResponse loginResponse =
          await userRepository.signInWithEmailAndPassword(
              email: event.email, password: event.password);
      if (loginResponse.message.toLowerCase() == 'login success') {
        authBloc.add(UserLoggedIn(userEmail: event.email));
        yield LoginSuccess();
      } else {
        yield LoginFailure(
            message: loginResponse.message
                .replaceAll(new RegExp(r'[\(\[].*?[\)\]]'), ''));
      }
    } catch (e) {
      print(e.toString());
      yield LoginFailure(message: 'Login Failed');
    }
  }

  Stream<LoginState> _mapRegisterAccountToState(RegisterAccount event) async* {
    yield LoginLoading();

    try {
      RegisterResponse registerResponse =
          await userRepository.registerWithEmailAndPassword(
              email: event.email, password: event.password);
      if (registerResponse.message.toLowerCase() == 'register success') {
        yield RegisterSuccess(message: registerResponse.message);
      } else {
        yield RegisterFailure(
            message: registerResponse.message
                .replaceAll(new RegExp(r'[\(\[].*?[\)\]]'), ''));
      }
    } catch (e) {
      print(e.toString());
      yield RegisterFailure(message: 'Register Failed');
    }
  }
}
