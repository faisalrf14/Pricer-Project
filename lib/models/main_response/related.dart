import 'package:pricer_project/models/main_response/keyword.dart';

class Related {
  final String relatedKeyword;
  final List<Keyword> otherRelated;

  Related({this.relatedKeyword, this.otherRelated});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['relatedKeyword'] = this.relatedKeyword;
    data['otherRelated'] = this.otherRelated;
    return data;
  }

  factory Related.fromJson(Map<String, dynamic> json) {
    if (json['otherRelated'] != null) {
      var tagObjsJson = json['otherRelated'] as List;
      List<Keyword> _otherRelated = tagObjsJson.map((e) => Keyword.fromJson(e)).toList();

      return Related(
        relatedKeyword: json['relatedKeyword'],
        otherRelated: _otherRelated,
      );
    } else {
      return Related(
        relatedKeyword: json['relatedKeyword'],
        otherRelated: json['otherRelated'],
      );
    }
  }
}
