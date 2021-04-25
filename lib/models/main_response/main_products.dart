class MainProducts {
  final int id;
  final String name;
  final String imageUrl;
  final String price;
  final String priceStr;
  final String url;
  final int itemId;
  final int shopId;
  final String originOlShop;

  MainProducts({this.id, this.name, this.imageUrl, this.price, this.priceStr, this.url, this.itemId, this.shopId, this.originOlShop});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['price'] = this.price;
    data['url'] = this.url;
    data['itemid'] = this.itemId;
    data['shopid'] = this.shopId;
    data['originOlShop'] = this.originOlShop;
    return data;
  }

  factory MainProducts.fromJson(Map<String, dynamic> json) {
    return MainProducts(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'].toString(),
      priceStr: json['priceStr'],
      url: json['url'],
      itemId: json['itemid'],
      shopId: json['shopid'],
      originOlShop: json['originOlShop'],
    );
  }
}
