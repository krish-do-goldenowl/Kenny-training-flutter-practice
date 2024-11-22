import 'package:flutter/material.dart';
import 'package:myapp/src/config/constants/enums.dart';
import 'package:myapp/src/router/coordinator.dart';
import 'package:myapp/src/theme/styles.dart';
import 'package:myapp/widgets/forms/register_form.dart';
import 'package:myapp/widgets/layout/base_layout.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void submitForm() {
    if (formKey.currentState?.validate() ?? false) {
      // Perform the form submission logic here
      print('Form submitted');
    }
  }

  void onTapPressed() {
    AppCoordinator.showLoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      buttonText: 'Register',
      onButtonPressed: submitForm,
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
                    textAlign: TextAlign.center, style: AppStyles.smallText),
              ),
              const SizedBox(height: 30),
              RegisterForm(formKey: formKey)
            ],
          )
        ],
      ),
      currentView: CurrentView.register,
    );
  }
}
