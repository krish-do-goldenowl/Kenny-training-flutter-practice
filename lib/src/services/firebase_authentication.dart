import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:myapp/src/config/constants/constants.dart';
import 'package:myapp/src/network/model/auth_response.dart';
import 'package:myapp/src/network/model/users.dart';

class FirebaseAuthenticationServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<AuthResponse> registerByEmailAndPassword(
      {required String email,
      required String password,
      required String fullName}) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firestore
          .collection(AppConstants.firestoreCollections.userCollection)
          .doc(result.user?.uid)
          .set(
              Users(email: email, fullName: fullName, createdAt: DateTime.now())
                  .toMap());
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
