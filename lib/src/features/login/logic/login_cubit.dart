import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/features/login/logic/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  // Update logic later
  void handleLogin({required String email, required String password}) {
    emit(state.copyWith(email: email, password: password));
  }
}
