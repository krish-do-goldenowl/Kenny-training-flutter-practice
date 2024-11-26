part of './register_cubit.dart';

class RegisterState {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;
  final String? errorMessage;
  final AuthStatus? status;

  RegisterState(
      {this.fullName = '',
      this.email = '',
      this.password = '',
      this.confirmPassword = '',
      this.errorMessage,
      this.status = AuthStatus.initial});

  RegisterState copyWith(
      {String? fullName,
      String? email,
      String? password,
      String? confirmPassword,
      String? errorMessage,
      AuthStatus? status}) {
    return RegisterState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      errorMessage: errorMessage,
      status: status ?? status,
    );
  }
}
