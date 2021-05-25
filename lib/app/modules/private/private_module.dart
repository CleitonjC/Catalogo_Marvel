import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelcatalogo/app/core/http/http_provider_impl.dart';
import 'package:marvelcatalogo/app/modules/private/detalhes/detalhes_module.dart';
import 'package:marvelcatalogo/app/modules/private/favoritos/favorite_module.dart';
import 'package:marvelcatalogo/app/repositories/character/character_repository_impl.dart';

import 'home/home_module.dart';

class PrivateModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HttpProviderImpl()),
    Bind.lazySingleton((i) => CharacterRepositoryImpl(httpProvider: i.get()))
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/detalhes', module: DetalhesModule()),
    ModuleRoute('/favorite', module: FavoriteModule())
  ];
}
