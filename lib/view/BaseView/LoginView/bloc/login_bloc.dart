import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pricer_project/models/login_response.dart';
import 'package:pricer_project/services/firebase_auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if(event is LoginAccount){
      yield* _mapLoginAccountToState(event);
    }
  }

  Stream<LoginState> _mapLoginAccountToState(LoginAccount event) async*{
    yield LoginLoading();

    try{
      LoginResponse loginResponse = await loginUser(email: event.email, password: event.password);
      print(loginResponse.message);
      if(loginResponse.message.toLowerCase() == 'login success'){
        yield LoginSucces();
      }else{
        yield LoginFailure(
          message: loginResponse.message.replaceAll(new RegExp(r'[\(\[].*?[\)\]]'), ''),
        );
      }
    } catch (e) {
      if (e.code == 'wrong-password'){
        print("Please check your password");
      }
      yield LoginFailure(message: 'Login Failed');
    }
  }
}

Future<LoginResponse> loginUser({String email, String password}) async {
  try {
    LoginResponse loginResponse = await FireBaseAuthService.signInWithEmail(email: email, password: password);
    if(loginResponse.user != null){
      return LoginResponse(message: 'Login Success', user: loginResponse.user);
    }else{
      return LoginResponse(message: loginResponse.message);
    }
  } on PlatformException catch (e) {
    print(e.toString());
    return LoginResponse(message: e.toString());
  }
}