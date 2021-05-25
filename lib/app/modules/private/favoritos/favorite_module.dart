import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelcatalogo/app/modules/private/favoritos/favorite_controller.dart';
import 'package:marvelcatalogo/app/modules/private/favoritos/favorite_page.dart';

class FavoriteModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FavoriteController(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => FavoritePage())
  ];
}
