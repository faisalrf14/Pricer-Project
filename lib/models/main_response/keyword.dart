import 'package:pricer_project/models/tokped/tokped_product.dart';

class Keyword {
  final String keyword;
  final String url;
  final List<TokpedProduct> product;

  Keyword({required this.keyword, required this.url, required this.product});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['keyword'] = this.keyword;
    data['url'] = this.url;
    data['product'] = this.product;
    return data;
  }

  factory Keyword.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      var tagObjsJson = json['product'] as List;
      List<TokpedProduct> _product =
          tagObjsJson.map((e) => TokpedProduct.fromJson(e)).toList();

      return Keyword(
        keyword: json['keyword'],
        url: json['url'],
        product: _product,
      );
    } else {
      return Keyword(
        keyword: json['keyword'],
        url: json['url'],
        product: json['product'],
      );
    }
  }
}
