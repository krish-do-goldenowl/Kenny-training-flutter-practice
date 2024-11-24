import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/config/constants/enums.dart';
import 'package:myapp/src/network/model/auth_response.dart';
import 'package:myapp/src/router/coordinator.dart';
import 'package:myapp/src/services/firebase_authentication.dart';

part './login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuthenticationServices _firebaseAuth;
  LoginCubit(this._firebaseAuth) : super(const LoginState());

  void updateEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void resetState() {
    emit(const LoginState());
  }

  Future<void> handleLogin() async {
    emit(state.copyWith(status: AuthStatus.loading));

    try {
      final AuthResponse response = await _firebaseAuth.loginByEmailAndPassword(
        email: state.email,
        password: state.password,
      );

      if (response.ok != null && response.ok!) {
        AppCoordinator.showDashboardScreen();
        resetState();
      } else {
        emit(state.copyWith(
          status: AuthStatus.failure,
          message: response.message ?? "Login failed",
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        message: "An unexpected error occurred: $e",
      ));
    }
  }
}
