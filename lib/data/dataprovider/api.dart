import 'dart:convert';

import 'package:pricer_project/models/login_response.dart';
import 'package:pricer_project/models/request_product.dart';
import 'package:pricer_project/models/tokped/tokped_response.dart';
import 'package:pricer_project/services/firebase_auth.dart';
import 'package:pricer_project/services/service_session_manager.dart';
import 'package:http/http.dart' as http;

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

  Future<TokpedResponse> getTokpedProduct({String query, String limit}) async {
    try {
      RequestProduct request = new RequestProduct(query: query, limit: limit);

      Map<String, String> headers = {'Content-type': 'application/json'};

      var response = await http.post(
        "http://localhost:8080/tokopedia/search",
        body: jsonEncode(request.toJson()),
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception('Failure');
      }

      var responseBody = jsonDecode(response.body);
      if (responseBody['responseCode'] != 200) {
        TokpedResponse response = new TokpedResponse(
          responseCode: 400,
          responseMessage: responseBody['responseMessage'],
        );
        return response;
      } else {
        var responseBody = jsonDecode(response.body);
        TokpedResponse basicResponse = TokpedResponse.fromJson(responseBody);
        return basicResponse;
      }
    } catch (e) {
      print(e);
      throw Exception('Failure');
    }
  }
}
