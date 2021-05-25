import 'dart:convert';

import 'package:marvelcatalogo/app/core/models/thumbnail.dart';
import 'package:marvelcatalogo/app/core/models/urls.dart';

import 'comic_list.dart';

class Character {
  int id;
  String name;
  String description;
  String modified;
  String resourceURI;
  List<Urls> urls;
  Thumbnail thumbnail;
  ComicList comics;

  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.resourceURI,
    required this.urls,
    required this.thumbnail,
    required this.comics,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'modified': modified,
      'resourceURI': resourceURI,
      'urls': urls.map((x) => x.toMap()).toList(),
      'thumbnail': thumbnail.toMap(),
      'comics': comics.toMap(),
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      modified: map['modified'],
      resourceURI: map['resourceURI'],
      urls: List<Urls>.from(map['urls']?.map((x) => Urls.fromMap(x))),
      thumbnail: Thumbnail.fromMap(map['thumbnail']),
      comics: ComicList.fromMap(map['comics']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Character.fromJson(String source) =>
      Character.fromMap(json.decode(source));
}
