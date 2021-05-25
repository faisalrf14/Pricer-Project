import 'package:pricer_project/models/main_response/shop.dart';

class MainProducts {
  final int id;
  final String name;
  final String imageUrl;
  final String price;
  final String url;
  final int itemId;
  final int shopId;
  final String originOlShop;
  final String shopLocation;
  final Shop shop;

  MainProducts({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.url,
    required this.itemId,
    required this.shopId,
    required this.originOlShop,
    required this.shopLocation,
    required this.shop,
  });

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
    data['shop_location'] = this.shopLocation;
    data['shop'] = this.shop;
    return data;
  }

  factory MainProducts.fromJson(Map<String, dynamic> json) {
    if (json['shop'] == null) {
      return MainProducts(
        id: json['id'],
        name: json['name'],
        imageUrl: json['imageUrl'],
        price: json['price'].toString(),
        url: json['url'],
        itemId: json['itemid'],
        shopId: json['shopid'],
        originOlShop: json['originOlShop'],
        shopLocation: json['shop_location'],
        shop: new Shop(city: ''),
      );
    } else {
      return MainProducts(
        id: json['id'],
        name: json['name'],
        imageUrl: json['imageUrl'],
        price: json['price'].toString(),
        url: json['url'],
        itemId: json['itemid'],
        shopId: json['shopid'],
        originOlShop: json['originOlShop'],
        shopLocation: json['shop_location'],
        shop: Shop.fromJson(json['shop']),
      );
    }
  }
}
