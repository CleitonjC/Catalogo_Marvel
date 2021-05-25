import 'package:marvelcatalogo/app/core/models/character_data_wrapper.dart';
import 'package:marvelcatalogo/app/repositories/character/character_repository.dart';
import 'package:mobx/mobx.dart';
part 'favorite_controller.g.dart';

class FavoriteController = _FavoriteControllerBase with _$FavoriteController;

abstract class _FavoriteControllerBase with Store {
  final CharacterRepository repository;

  _FavoriteControllerBase(this.repository);

  @observable
  CharacterDataWrapper? characterDataWrapper;

  @observable
  bool carregando = false;

  @action
  getCharacterDataWrapper() async {
    this.carregando = true;
    this.characterDataWrapper = await this.repository.get(null);
    this.carregando = false;
  }
}
