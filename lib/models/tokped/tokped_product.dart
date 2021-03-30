class TokpedProduct {
  final int id;
  final String name;
  final String categoryName;
  final String imageUrl;
  final String price;
  final String originalPrice;
  final String url;

  TokpedProduct({this.id, this.name, this.categoryName, this.imageUrl, this.price, this.originalPrice, this.url});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['categoryName'] = this.categoryName;
    data['imageUrl'] = this.imageUrl;
    data['price'] = this.price;
    data['originalPrice'] = this.originalPrice;
    data['url'] = this.url;
    return data;
  }

  factory TokpedProduct.fromJson(Map<String, dynamic> json) {
    return TokpedProduct(
      id: json['id'],
      name: json['name'],
      categoryName: json['categoryName'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      originalPrice: json['originalPrice'],
      url: json['url'],
    );
  }
}
