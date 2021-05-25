import 'dart:convert';

class Urls {
  String type;
  String url;

  Urls({required this.type, required this.url});

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'url': url,
    };
  }

  factory Urls.fromMap(Map<String, dynamic> map) {
    return Urls(
      type: map['type'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Urls.fromJson(String source) => Urls.fromMap(json.decode(source));
}
