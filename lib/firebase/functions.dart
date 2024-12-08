import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // instance firebase Auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Register
  Future<UserCredential> register({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw (e.code);
    }
  }

  // Login
  Future<UserCredential> login(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //! LOG OUT
  Future<void> logOut() async {
    return await _auth.signOut();
  }
}
