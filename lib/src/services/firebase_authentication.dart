import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/src/network/model/auth_response.dart';

class FirebaseAuthenticationServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<AuthResponse> registerByEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return AuthResponse(userCredentail: result, ok: true);
    } on FirebaseAuthException catch (e) {
      return AuthResponse(message: e.message, ok: false);
    }
  }

  Future<String?> loginByEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'User logged in successfully';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
