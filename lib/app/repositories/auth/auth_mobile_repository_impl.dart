import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_repository.dart';

class AuthMobileRepositoryImpl implements AuthRepository {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth;

  AuthMobileRepositoryImpl({
    required this.googleSignIn,
    required this.firebaseAuth,
  });

  @override
  Future<User> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential result = await firebaseAuth.signInWithCredential(credential);
    return result.user!;
  }

  @override
  User? userLogged() {
    return firebaseAuth.currentUser;
  }
}
