part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginAccount extends LoginEvent {
  final String email;
  final String password;

  LoginAccount({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}
