part of './login_cubit.dart';

class LoginState {
  final String email;
  final String password;
  final AuthStatus status;
  final String? message;

  const LoginState({
    this.email = '',
    this.password = '',
    this.status = AuthStatus.initial,
    this.message,
  });

  LoginState copyWith({
    String? email,
    String? password,
    AuthStatus? status,
    String? message,
    bool? isLoading,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      message: message,
    );
  }
}
