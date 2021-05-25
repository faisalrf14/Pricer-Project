class RequestProduct {
  final String query;
  final String limit;
  final bool fromLow;

  RequestProduct({
    required this.query,
    required this.limit,
    required this.fromLow,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['query'] = this.query;
    data['limit'] = this.limit;
    data['fromLow'] = this.fromLow;
    return data;
  }

  factory RequestProduct.fromJson(Map<String, dynamic> json) {
    return RequestProduct(
      query: json['query'],
      limit: json['limit'],
      fromLow: json['fromLow'],
    );
  }
}
