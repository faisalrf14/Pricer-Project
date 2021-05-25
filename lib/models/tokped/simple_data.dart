import 'package:pricer_project/models/main_response/related.dart';
import 'package:pricer_project/models/tokped/tokped_product.dart';

class SimpleData {
  final Related related;
  final List<TokpedProduct> products;

  SimpleData({required this.related, required this.products});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['related'] = this.related;
    data['products'] = this.products;
    return data;
  }

  factory SimpleData.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      var tagObjsJson = json['products'] as List;
      List<TokpedProduct> _product =
          tagObjsJson.map((e) => TokpedProduct.fromJson(e)).toList();

      return SimpleData(
        related: Related.fromJson(json['related']),
        products: _product,
      );
    } else {
      return SimpleData(
        related: Related.fromJson(json['related']),
        products: json['products'],
      );
    }
  }
}
