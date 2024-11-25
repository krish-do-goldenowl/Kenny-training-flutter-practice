part of './register_cubit.dart';

class RegisterState {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterState(
      {this.fullName = '',
      this.email = '',
      this.password = '',
      this.confirmPassword = ''});

  RegisterState copyWith(
      {String? fullName,
      String? email,
      String? password,
      String? confirmPassword}) {
    return RegisterState(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword);
  }
}
