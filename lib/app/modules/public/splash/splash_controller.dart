import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelcatalogo/app/core/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';
part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final AuthController authController = Modular.get();

  @observable
  bool initialized = false;

  @observable
  bool error = false;

  @action
  verificaUsuarioLogado() async {
    try {
      Timer(Duration(seconds: 1), () {
        initialized = true;
        authController.checkLogin();
        if (authController.status == AuthStatus.login) {
          Modular.to.navigate('/private/home', replaceAll: true);
        }
      });
    } catch (e) {
      error = true;
    }
  }
}
