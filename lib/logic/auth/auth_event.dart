part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppLoaded extends AuthEvent {}

class UserLoggedIn extends AuthEvent {
  final String userEmail;

  UserLoggedIn({@required this.userEmail});

  @override
  List<Object> get props => [userEmail];
}

class UserLoggedOut extends AuthEvent {}
