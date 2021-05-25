class ShopeeProduct {
  final String name;
  final int itemId;
  final int shopId;
  final int price;

  ShopeeProduct({
    required this.name,
    required this.itemId,
    required this.shopId,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nama'] = this.name;
    data['itemid'] = this.itemId;
    data['shopid'] = this.shopId;
    data['price'] = this.price;
    return data;
  }

  factory ShopeeProduct.fromJson(Map<String, dynamic> json) {
    return ShopeeProduct(
      name: json['name'],
      itemId: json['itemid'],
      shopId: json['shopid'],
      price: json['price'],
    );
  }
}
