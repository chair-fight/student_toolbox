import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth;

  AuthService() {
    this._auth = FirebaseAuth.instance;
  }

  Future<User> emailSignIn(String email, String password) async =>
      (await _auth.signInWithEmailAndPassword(email: email, password: password))
          .user;

  Future<User> emailRegister(String email, String password) async =>
      (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;

  Future<void> logOut() async => (await _auth.signOut());

  Stream<User> get user => _auth.authStateChanges();

  User get currentUser => FirebaseAuth.instance.currentUser;
}
