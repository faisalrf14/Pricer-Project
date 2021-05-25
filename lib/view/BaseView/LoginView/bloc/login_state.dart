part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class RegisterLoading extends LoginState {}

class RegisterSuccess extends LoginState {
  final String message;

  RegisterSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class RegisterFailure extends LoginState {
  final String message;

  RegisterFailure({required this.message});

  @override
  List<Object> get props => [message];
}
