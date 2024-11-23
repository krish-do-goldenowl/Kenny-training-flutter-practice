part of './register_cubit.dart';

class RegisterState {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;
  final String? errorMessage;
  final bool? isLoading;

  RegisterState(
      {this.fullName = '',
      this.email = '',
      this.password = '',
      this.confirmPassword = '',
      this.errorMessage,
      this.isLoading = false});

  RegisterState copyWith(
      {String? fullName,
      String? email,
      String? password,
      String? confirmPassword,
      String? errorMessage,
      bool? isLoading}) {
    return RegisterState(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        errorMessage: errorMessage,
        isLoading: isLoading ?? this.isLoading);
  }
}
