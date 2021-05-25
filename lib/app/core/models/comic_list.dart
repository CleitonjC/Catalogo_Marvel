import 'dart:convert';

import 'commic_sumary.dart';

class ComicList {
  int available;
  int returned;
  String collectionURI;
  List<ComicSummary> items;

  ComicList({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return {
      'available': available,
      'returned': returned,
      'collectionURI': collectionURI,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory ComicList.fromMap(Map<String, dynamic> map) {
    return ComicList(
      available: map['available'],
      returned: map['returned'],
      collectionURI: map['collectionURI'],
      items: List<ComicSummary>.from(
          map['items']?.map((x) => ComicSummary.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ComicList.fromJson(String source) =>
      ComicList.fromMap(json.decode(source));
}
