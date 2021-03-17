import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pricer_project/models/login_response.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseAuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  // static GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<LoginResponse> signInWithEmailAndPassword({String email, String password}) async {
    await Firebase.initializeApp();
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return LoginResponse(user: userCredential.user);
    } catch (e) {
      return LoginResponse(message: e.toString());
    }
  }
}
