import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pricer_project/models/login_response.dart';
import 'package:pricer_project/models/register_response.dart';

class FireBaseAuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<LoginResponse> signInWithEmailAndPassword({String email, String password}) async {
    await Firebase.initializeApp();
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return LoginResponse(user: userCredential.user);
    } catch (e) {
      return LoginResponse(message: e.toString());
    }
  }

  static Future<Object> registerWithEmailAndPassword({String email, String password}) async {
    await Firebase.initializeApp();
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return RegisterResponse(user: userCredential.user);
    } catch (e) {
      print(e);
      return RegisterResponse(message: e.toString());
    }
  }
}
