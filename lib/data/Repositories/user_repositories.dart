import 'package:pricer_project/data/dataprovider/api.dart';
import 'package:pricer_project/models/login_response.dart';
import 'package:pricer_project/models/register_response.dart';

class UserRepository {
  final PricerApi pricerApi;
  UserRepository({this.pricerApi});

  // user login
  Future<LoginResponse> signInWithEmailAndPassword({String email, String password}) async {
    LoginResponse loginResponse = await pricerApi.signInWithEmailAndPassword(email: email, password: password);
    return loginResponse;
  }

  // user register
  Future<RegisterResponse> registerWithEmailAndPassword({String email, String password}) async {
    RegisterResponse registerResponse = await pricerApi.registerWithEmailAndPassword(email: email, password: password);
    return registerResponse;
  }
}
