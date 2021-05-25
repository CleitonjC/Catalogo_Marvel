import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marvelcatalogo/app/core/auth/auth_controller.dart';
import 'package:marvelcatalogo/app/repositories/auth/auth_mobile_repository_impl.dart';
import 'package:marvelcatalogo/app/repositories/auth/auth_web_repository_impl.dart';

import 'private/private_module.dart';
import 'public/public_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthController(i.get())),
    Bind.lazySingleton(
      (i) => kIsWeb
          ? AuthWebRepository(
              googleProvider: GoogleAuthProvider(),
              firebaseAuth: FirebaseAuth.instance,
            )
          : AuthMobileRepositoryImpl(
              firebaseAuth: FirebaseAuth.instance,
              googleSignIn: GoogleSignIn(),
            ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/public', module: PublicModule()),
    ModuleRoute('/private', module: PrivateModule())
  ];
}
