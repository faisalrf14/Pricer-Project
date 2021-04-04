import 'package:pricer_project/models/tokped/simple_data.dart';

class TokpedResponse {
  final int responseCode;
  final String responseMessage;
  final SimpleData data;

  TokpedResponse({this.responseCode, this.responseMessage, this.data});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['responseMessage'] = this.responseMessage;
    data['data'] = this.data;
    return data;
  }

  factory TokpedResponse.fromJson(Map<String, dynamic> json) {
    return TokpedResponse(
      responseCode: json['responseCode'],
      responseMessage: json['responseMessage'],
      data: SimpleData.fromJson(json['data']),
    );
  }
}
