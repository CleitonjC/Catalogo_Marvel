import 'package:firebase_auth/firebase_auth.dart';
import 'package:marvelcatalogo/app/repositories/auth/auth_repository.dart';

class AuthWebRepository implements AuthRepository {
  final GoogleAuthProvider googleProvider;
  final FirebaseAuth firebaseAuth;

  AuthWebRepository({required this.googleProvider, required this.firebaseAuth});

  @override
  Future<User> loginWithGoogle() async {
    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    UserCredential result = await firebaseAuth.signInWithPopup(googleProvider);
    return result.user!;
  }

  @override
  User? userLogged() {
    return firebaseAuth.currentUser;
  }
}
