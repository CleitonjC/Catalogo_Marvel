import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelcatalogo/app/modules/private/detalhes/detalhe_controller.dart';
import 'package:marvelcatalogo/app/modules/private/detalhes/detalhe_page.dart';

class DetalhesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DetalheController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => DetalhesPage(
        character: args.data,
      ),
    )
  ];
}
