import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelcatalogo/app/modules/private/home/home_controller.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeController(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => HomePage())
  ];
}
