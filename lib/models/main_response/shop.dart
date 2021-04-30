class Shop {
  final String city;

  Shop({this.city});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['city'] = this.city;
    return data;
  }

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      city: json['city'],
    );
  }
}
