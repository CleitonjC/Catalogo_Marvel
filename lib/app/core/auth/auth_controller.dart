import 'package:firebase_auth/firebase_auth.dart';
import 'package:marvelcatalogo/app/repositories/auth/auth_repository.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final AuthRepository authRepository;

  _AuthControllerBase(this.authRepository);

  @observable
  User? user;

  @observable
  AuthStatus status = AuthStatus.loading;

  loginWithGoogle() async {
    final user = await authRepository.loginWithGoogle();
    setUser(user);
  }

  void checkLogin() {
    final user = authRepository.userLogged();
    setUser(user);
  }

  @action
  setUser(User? user) {
    this.user = user;
    this.status = this.user == null ? AuthStatus.logoff : AuthStatus.login;
  }
}

enum AuthStatus { loading, login, logoff }
