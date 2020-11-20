import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_toolbox/model/app_user.dart';

class AuthService {
  FirebaseAuth _auth;

  AuthService() {
    this._auth = FirebaseAuth.instance;
  }

  Future<AppUser> emailSignIn(String email, String password) async {
    User user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    return AppUser(user.uid);
  }
}
