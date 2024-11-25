import 'package:flutter/material.dart';
import 'package:myapp/widgets/forms/rounded_text_input.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const LoginForm({super.key, required this.formKey});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: const Column(
        children: [
          RoundedTextFormField(hintText: 'Enter your Email'),
          SizedBox(height: 20),
          RoundedTextFormField(
            hintText: 'Enter your password',
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
