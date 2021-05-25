import 'dart:convert';

import 'character_data_container.dart';

class CharacterDataWrapper {
  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHTML;
  CharacterDataContainer data;
  String etag;

  CharacterDataWrapper({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHTML,
    required this.data,
    required this.etag,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'status': status,
      'copyright': copyright,
      'attributionText': attributionText,
      'attributionHTML': attributionHTML,
      'data': data.toMap(),
      'etag': etag,
    };
  }

  factory CharacterDataWrapper.fromMap(Map<String, dynamic> map) {
    return CharacterDataWrapper(
      code: map['code'],
      status: map['status'],
      copyright: map['copyright'],
      attributionText: map['attributionText'],
      attributionHTML: map['attributionHTML'],
      data: CharacterDataContainer.fromMap(map['data']),
      etag: map['etag'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterDataWrapper.fromJson(String source) =>
      CharacterDataWrapper.fromMap(json.decode(source));
}
