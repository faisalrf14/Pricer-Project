import 'package:pricer_project/models/tokped/tokped_product.dart';

class TokpedResponse {
  final int responseCode;
  final String responseMessage;
  final List<TokpedProduct> data;

  TokpedResponse({this.responseCode, this.responseMessage, this.data});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['responseMessage'] = this.responseMessage;
    data['data'] = this.data;
    return data;
  }

  factory TokpedResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      var tagObjsJson = json['data'] as List;
      List<TokpedProduct> _product = tagObjsJson.map((e) => TokpedProduct.fromJson(e)).toList();

      return TokpedResponse(
        responseCode: json['responseCode'],
        responseMessage: json['responseMessage'],
        data: _product,
      );
    } else {
      return TokpedResponse(
        responseCode: json['responseCode'],
        responseMessage: json['responseMessage'],
        data: json['data'],
      );
    }
  }
}
