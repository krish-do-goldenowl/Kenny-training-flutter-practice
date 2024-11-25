import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/gen/assets.gen.dart';
import 'package:myapp/src/config/constants/enums.dart';
import 'package:myapp/src/router/coordinator.dart';
import 'package:myapp/src/theme/styles.dart';

import 'package:myapp/widgets/forms/login_form.dart';
import 'package:myapp/widgets/layout/base_layout.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void submitForm() {
    if (formKey.currentState?.validate() ?? false) {
      // Perform the form submission logic here
      print('Form submitted');
    }
  }

  void onTapPressed() {
    AppCoordinator.showRegisterScreen();
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      buttonText: 'Login',
      onButtonPressed: submitForm,
      onTapPressed: onTapPressed,
      content: Column(
        children: [
          Column(
            children: [
              const Text('Welcome Back', style: AppStyles.boldText),
              const SizedBox(height: 30),
              SvgPicture.asset(Assets.svgs.loginScreenBg,
                  semanticsLabel: "Login bg image", width: 200),
              const SizedBox(height: 40),
              LoginForm(formKey: formKey),
              const SizedBox(height: 30),
              const Text(
                'Forget password?',
                style: AppStyles.highLightText,
              )
            ],
          )
        ],
      ),
      currentView: CurrentView.login,
    );
  }
}
