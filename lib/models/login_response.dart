import 'package:firebase_auth/firebase_auth.dart';

class LoginResponse {
  final User user;
  final String message;

  LoginResponse({this.user, this.message});
}