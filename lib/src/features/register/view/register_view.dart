import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/config/constants/enums.dart';
import 'package:myapp/src/features/register/logic/register_cubit.dart';
import 'package:myapp/src/router/coordinator.dart';
import 'package:myapp/src/theme/styles.dart';
import 'package:myapp/widgets/forms/register_form.dart';
import 'package:myapp/widgets/layout/base_layout.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onTapPressed() {
    AppCoordinator.showLoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();

    return BlocBuilder<RegisterCubit, RegisterState>(
        buildWhen: (previous, current) =>
            previous.errorMessage != current.errorMessage ||
            previous.isSuccess != current.isSuccess,
        builder: (BuildContext context, RegisterState state) {
          return BaseLayout(
            buttonText: 'Register',
            onButtonPressed: () => registerCubit.handleRegister(context),
            onTapPressed: onTapPressed,
            content: Column(
              children: [
                Column(
                  children: [
                    const Text(
                      'Welcome to Onboard!',
                      style: AppStyles.boldText,
                    ),
                    const SizedBox(height: 30),
                    const SizedBox(
                      width: 200,
                      child: Text("Let's help to meet up your tasks.",
                          textAlign: TextAlign.center,
                          style: AppStyles.smallText),
                    ),
                    const SizedBox(height: 30),
                    RegisterForm(
                      formKey: formKey,
                    ),
                    if (state.errorMessage != null) ...[
                      const SizedBox(height: 20),
                      Text(
                        state.errorMessage!,
                        style: AppStyles.smallText.copyWith(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                )
              ],
            ),
            currentView: CurrentView.register,
          );
        });
  }
}
