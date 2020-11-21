import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_toolbox/services/database.dart';

class AuthService {
  FirebaseAuth _auth;

  AuthService() {
    this._auth = FirebaseAuth.instance;
  }

  Future<User> emailSignIn(String email, String password) async =>
      (await _auth.signInWithEmailAndPassword(email: email, password: password))
          .user;

  Future<User> emailRegister(String email, String password, String name,
      String surname, String university) async {
    var user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    try {
      await Database.registerUser(user.uid, name, surname, email, university);
    } on DatabaseException {
      await user.delete();
      throw FirebaseAuthException(
          message:
              "An error occurred when trying to add the user to the database. The account was not created.");
    }
    return user;
  }

  Future<void> sendVerificationEmail(User user) async =>
      await user.sendEmailVerification();

  Future<void> logOut() async => (await _auth.signOut());

  Stream<User> get user => _auth.authStateChanges();

  User get currentUser => FirebaseAuth.instance.currentUser;

  Future<void> deleteAccount(String email, String password) async {
    var user = await emailSignIn(email, password);
    await user.delete();
  }
}
