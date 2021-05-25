import 'dart:convert';

class ComicSummary {
  String resourceURI;
  String name;

  ComicSummary({required this.resourceURI, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'resourceURI': resourceURI,
      'name': name,
    };
  }

  factory ComicSummary.fromMap(Map<String, dynamic> map) {
    return ComicSummary(
      resourceURI: map['resourceURI'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ComicSummary.fromJson(String source) =>
      ComicSummary.fromMap(json.decode(source));
}
