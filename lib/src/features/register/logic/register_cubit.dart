import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/features/register/logic/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());

  // Update logic later
  void handleRegister({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    emit(state.copyWith(
      fullName: fullName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    ));
  }
}
