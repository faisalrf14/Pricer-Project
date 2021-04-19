import 'package:pricer_project/models/shopee/shopee_product.dart';

class ShopeeResponse {
  final int responseCode;
  final String responseMessage;
  List<ShopeeProduct> data;

  ShopeeResponse({this.responseCode, this.responseMessage, this.data});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['responseMessage'] = this.responseMessage;
    data['data'] = this.data;
    return data;
  }

  factory ShopeeResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      var tagObjsJson = json['data'] as List;
      List<ShopeeProduct> _data = tagObjsJson.map((e) => ShopeeProduct.fromJson(e)).toList();
      return ShopeeResponse(
        responseCode: json['responseCode'],
        responseMessage: json['responseMessage'],
        data: _data,
      );
    } else {
      return ShopeeResponse(
        responseCode: json['responseCode'],
        responseMessage: json['responseMessage'],
        data: json['data'],
      );
    }
  }
}
