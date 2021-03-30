class RequestProduct {
  final String query;
  final String limit;

  RequestProduct({this.query, this.limit});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['query'] = this.query;
    data['limit'] = this.limit;
    return data;
  }

  factory RequestProduct.fromJson(Map<String, dynamic> json) {
    return RequestProduct(
      query: json['query'],
      limit: json['limit'],
    );
  }
}
