import 'package:pricer_project/models/main_response/main_data.dart';

class MainResponse {
  final int responseCode;
  final String responseMessage;
  final MainData data;

  MainResponse({this.responseCode, this.responseMessage, this.data});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['responseMessage'] = this.responseMessage;
    data['data'] = this.data;
    return data;
  }

  factory MainResponse.fromJson(Map<String, dynamic> json) {
    return MainResponse(
      responseCode: json['responseCode'],
      responseMessage: json['responseMessage'],
      data: MainData.fromJson(json['data']),
    );
  }
}
