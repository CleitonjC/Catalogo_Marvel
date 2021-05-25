import 'package:marvelcatalogo/app/core/models/character_data_wrapper.dart';

abstract class CharacterRepository {
  Future<CharacterDataWrapper> get(Map<String, dynamic>? parametros);
}
