import 'package:marvelcatalogo/app/core/models/character_data_wrapper.dart';
import 'package:marvelcatalogo/app/repositories/character/character_repository.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final CharacterRepository repository;

  _HomeControllerBase(this.repository);

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
