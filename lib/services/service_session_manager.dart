import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManagerService {
  final String credentialKey = 'user_email';

  Future<void> setUser(User? user) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString(credentialKey, user!.email.toString());
  }

  Future<String> getUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String userEmail = sharedPreferences.getString(credentialKey) ?? '';
    return userEmail;
  }
}
