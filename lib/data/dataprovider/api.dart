import 'dart:convert';

import 'package:pricer_project/data/constant.dart';
import 'package:pricer_project/models/login_response.dart';
import 'package:pricer_project/models/main_response/main_data.dart';
import 'package:pricer_project/models/main_response/main_response.dart';
import 'package:pricer_project/models/main_response/related.dart';
import 'package:pricer_project/models/register_response.dart';
import 'package:pricer_project/models/request_product.dart';
import 'package:pricer_project/models/shopee/shopee_response.dart';
import 'package:pricer_project/models/tokped/simple_data.dart';
import 'package:pricer_project/models/tokped/tokped_response.dart';
import 'package:pricer_project/services/firebase_auth.dart';
import 'package:pricer_project/services/service_session_manager.dart';
import 'package:http/http.dart' as http;

class PricerApi {
  PricerApi();

  Future<LoginResponse> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      LoginResponse loginResponse =
          await FireBaseAuthService.signInWithEmailAndPassword(
              email: email, password: password);
      if (loginResponse.user != null) {
        SessionManagerService().setUser(loginResponse.user);
        return LoginResponse(message: "Login success", user: null);
      } else {
        return LoginResponse(message: loginResponse.message, user: null);
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failure');
    }
  }

  Future<RegisterResponse> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      RegisterResponse registerResponse =
          await FireBaseAuthService.registerWithEmailAndPassword(
              email: email, password: password);
      if (registerResponse.user != null) {
        SessionManagerService().setUser(registerResponse.user);
        return RegisterResponse(message: "Register Success", user: null);
      } else {
        return RegisterResponse(message: registerResponse.message, user: null);
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failure');
    }
  }

  Future<MainResponse> getMainProducts({
    required String query,
    required String limit,
    required bool fromLow,
  }) async {
    try {
      RequestProduct request = new RequestProduct(
        query: query,
        limit: limit,
        fromLow: fromLow,
      );

      Map<String, String> headers = {'Content-type': 'application/json'};
      var response = await http.post(
        Uri.parse(baseAPI + "main/search"),
        body: jsonEncode(request.toJson()),
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception('Failure');
      }

      var responseBody = jsonDecode(response.body);
      if (responseBody['responseCode'] != 200) {
        MainResponse response = new MainResponse(
          responseCode: 400,
          responseMessage: responseBody['responseMessage'],
          data: new MainData(
            related: new Related(relatedKeyword: '', otherRelated: []),
            products: [],
          ),
        );
        return response;
      } else {
        MainResponse basicResponse = MainResponse.fromJson(responseBody);
        return basicResponse;
      }
    } catch (e) {
      print(e);
      throw Exception('Failure');
    }
  }

  Future<TokpedResponse> getTokpedProduct(
      {required String query, required String limit}) async {
    try {
      RequestProduct request = new RequestProduct(
        query: query,
        limit: limit,
        fromLow: true,
      );

      Map<String, String> headers = {'Content-type': 'application/json'};
      var response = await http.post(
        new Uri.dataFromString(baseAPI + "tokopedia/search"),
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
          data: new SimpleData(
              related: new Related(relatedKeyword: '', otherRelated: []),
              products: []),
        );
        return response;
      } else {
        TokpedResponse basicResponse = TokpedResponse.fromJson(responseBody);
        return basicResponse;
      }
    } catch (e) {
      print(e);
      throw Exception('Failure');
    }
  }

  Future<ShopeeResponse> getShopeeProduct(
      {required String query, required String limit}) async {
    try {
      RequestProduct request = new RequestProduct(
        query: query,
        limit: limit,
        fromLow: true,
      );

      Map<String, String> headers = {'Content-type': 'application/json'};

      var response = await http.post(
        new Uri.dataFromString(baseAPI + "shopee/search"),
        body: jsonEncode(request.toJson()),
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception('Failure');
      }

      var responseBody = jsonDecode(response.body);
      if (responseBody['responseCode'] != 200) {
        ShopeeResponse response = new ShopeeResponse(
          responseCode: 400,
          responseMessage: responseBody['responseMessage'],
          data: [],
        );
        return response;
      } else {
        ShopeeResponse response = ShopeeResponse.fromJson(responseBody);
        return response;
      }
    } catch (e) {
      print(e);
      throw Exception('Failure');
    }
  }
}
