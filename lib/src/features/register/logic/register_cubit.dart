import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/network/model/auth_response.dart';
import 'package:myapp/src/services/firebase_authentication.dart';

part './register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final FirebaseAuthenticationServices _firebaseAuth;
  RegisterCubit(this._firebaseAuth) : super(RegisterState());
  bool get isPasswordMatch => state.password == state.confirmPassword;
  final String defaultErrorMessage = "Password does not match";

  void updateFullName(String fullName) {
    emit(state.copyWith(fullName: fullName));
  }

  void updateEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void updateConfirmPassword(String confirmPassword) {
    emit(state.copyWith(confirmPassword: confirmPassword));
  }

  void resetForm() {
    emit(state.copyWith(
        fullName: '',
        email: '',
        password: '',
        confirmPassword: '',
        errorMessage: null,
        isSuccess: false));
  }

  Future<void> handleRegister() async {
    if (!isPasswordMatch) {
      emit(state.copyWith(errorMessage: defaultErrorMessage));
      return;
    }

    final AuthResponse result = await _firebaseAuth.registerByEmailAndPassword(
        email: state.email, password: state.password, fullName: state.fullName);
    if (result.message != null && result.message!.isNotEmpty) {
      emit(state.copyWith(errorMessage: result.message, isSuccess: false));
    } else {
      emit(state.copyWith(isSuccess: true));
    }
  }
}
