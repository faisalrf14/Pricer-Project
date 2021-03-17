import 'package:pricer_project/models/login_response.dart';
import 'package:pricer_project/services/firebase_auth.dart';
import 'package:pricer_project/services/service_session_manager.dart';

class PricerApi {
  PricerApi();

  Future<LoginResponse> signInWithEmailAndPassword({String email, String password}) async {
    try {
      LoginResponse loginResponse = await FireBaseAuthService.signInWithEmailAndPassword(email: email, password: password);
      if (loginResponse.user != null) {
        SessionManagerService().setUser(loginResponse.user);
        return LoginResponse(message: "Login success");
      } else {
        return LoginResponse(message: loginResponse.message);
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failure');
    }
  }
}
