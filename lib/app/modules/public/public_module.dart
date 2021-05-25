import 'package:flutter_modular/flutter_modular.dart';


import 'package:marvelcatalogo/app/modules/public/splash/splash_controller.dart';

import 'login/login_module.dart';
import 'register/register_module.dart';
import 'splash/splash_page.dart';


class PublicModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => SplashController())];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/splash', child: (_, __) => SplashPage()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/register', module: RegisterModule()),

  ];
}
