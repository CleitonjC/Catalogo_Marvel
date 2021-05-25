import 'package:marvelcatalogo/app/core/http/http_provider.dart';
import 'package:marvelcatalogo/app/core/models/character_data_wrapper.dart';
import 'package:marvelcatalogo/app/repositories/character/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final HttpProvider httpProvider;
  final String url = '/v1/public/characters';

  CharacterRepositoryImpl({required this.httpProvider});

  @override
  Future<CharacterDataWrapper> get(Map<String, dynamic>? parametros) async {
    final result = await this.httpProvider.fetch(this.url, parametros);
    return CharacterDataWrapper.fromMap(result);
  }
}
