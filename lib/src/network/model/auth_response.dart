import 'package:firebase_auth/firebase_auth.dart';

class AuthResponse {
  final UserCredential? userCredentail;
  final String? message;
  final bool? ok;

  AuthResponse({this.message, this.ok, this.userCredentail});
}
