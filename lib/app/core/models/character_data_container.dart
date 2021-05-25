import 'dart:convert';

import 'character.dart';

class CharacterDataContainer {
  int offset;
  int limit;
  int total;
  int count;
  List<Character> results;

  CharacterDataContainer({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  Map<String, dynamic> toMap() {
    return {
      'offset': offset,
      'limit': limit,
      'total': total,
      'count': count,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory CharacterDataContainer.fromMap(Map<String, dynamic> map) {
    return CharacterDataContainer(
      offset: map['offset'],
      limit: map['limit'],
      total: map['total'],
      count: map['count'],
      results: List<Character>.from(
          map['results']?.map((x) => Character.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterDataContainer.fromJson(String source) =>
      CharacterDataContainer.fromMap(json.decode(source));
}
