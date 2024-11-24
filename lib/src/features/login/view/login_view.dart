import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/gen/assets.gen.dart';
import 'package:myapp/src/config/constants/enums.dart';
import 'package:myapp/src/features/login/logic/login_cubit.dart';
import 'package:myapp/src/router/coordinator.dart';
import 'package:myapp/src/theme/styles.dart';

import 'package:myapp/widgets/forms/login_form.dart';
import 'package:myapp/widgets/layout/base_layout.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onTapPressed() {
    AppCoordinator.showRegisterScreen();
  }

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
        builder: (BuildContext context, LoginState state) {
      return BaseLayout(
          buttonText: 'Login',
          onButtonPressed: loginCubit.handleLogin,
          onTapPressed: onTapPressed,
          isLoading: state.status,
          content: Column(
            children: [
              Column(
                children: [
                  const Text('Welcome Back', style: AppStyles.boldText),
                  const SizedBox(height: 30),
                  SvgPicture.asset(Assets.svgs.loginScreenBg,
                      semanticsLabel: "Login bg image", width: 200),
                  const SizedBox(height: 30),
                  LoginForm(
                    formKey: formKey,
                  ),
                  if (state.message != null) ...[
                    const SizedBox(height: 20),
                    Text(
                      state.message!,
                      style: AppStyles.smallText.copyWith(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  SizedBox(height: state.message != null ? 10 : 30),
                  const Text(
                    'Forget password?',
                    style: AppStyles.highLightText,
                  )
                ],
              )
            ],
          ),
          currentView: CurrentView.login);
    });
  }
}
