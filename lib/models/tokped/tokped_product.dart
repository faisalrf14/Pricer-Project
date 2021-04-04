class TokpedProduct {
  final int id;
  final String name;
  final String imageUrl;
  final String price;
  final String priceStr;
  final String url;

  TokpedProduct(
      {this.id, this.name, this.imageUrl, this.price, this.priceStr, this.url});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['price'] = this.price;
    data['url'] = this.url;
    return data;
  }

  factory TokpedProduct.fromJson(Map<String, dynamic> json) {
    return TokpedProduct(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'].toString(),
      priceStr: json['priceStr'],
      url: json['url'],
    );
  }
}
