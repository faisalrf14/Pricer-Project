import 'package:firebase_auth/firebase_auth.dart';

class RegisterResponse {
  final User? user;
  final String message;

  RegisterResponse({required this.user, required this.message});
}
