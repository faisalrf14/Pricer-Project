import 'package:pricer_project/models/main_response/main_products.dart';
import 'package:pricer_project/models/main_response/related.dart';

class MainData {
  final Related related;
  final List<MainProducts> products;

  MainData({required this.related, required this.products});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['related'] = this.related;
    data['products'] = this.products;
    return data;
  }

  factory MainData.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      var tagObjsJson = json['products'] as List;
      List<MainProducts> _product =
          tagObjsJson.map((e) => MainProducts.fromJson(e)).toList();
      return MainData(
        related: Related.fromJson(json['related']),
        products: _product,
      );
    } else {
      return MainData(
        related: Related.fromJson(json['related']),
        products: json['products'],
      );
    }
  }
}
