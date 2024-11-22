import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      buttonText: 'Login',
      onButtonPressed: submitForm,
      content: Column(
        children: [
          Column(
            children: [
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 30),
              SvgPicture.asset('assets/svgs/login_screen_bg.svg',
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
      currentView: 'login',
    );
  }
}
