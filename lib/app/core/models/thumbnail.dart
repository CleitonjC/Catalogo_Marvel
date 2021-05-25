import 'dart:convert';

class Thumbnail {
  String path;
  String extension;

  Thumbnail({required this.path, required this.extension});

  Map<String, dynamic> toMap() {
    return {
      'path': path,
      'extension': extension,
    };
  }

  factory Thumbnail.fromMap(Map<String, dynamic> map) {
    return Thumbnail(
      path: map['path'],
      extension: map['extension'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Thumbnail.fromJson(String source) =>
      Thumbnail.fromMap(json.decode(source));

  String get caminhoCompleto => '${this.path}.${this.extension}';
}
