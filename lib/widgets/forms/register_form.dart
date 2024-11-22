import 'package:flutter/material.dart';
import 'package:myapp/widgets/forms/rounded_text_input.dart';

class RegisterForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const RegisterForm({super.key, required this.formKey});

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: const Column(
        children: [
          RoundedTextFormField(hintText: 'Enter your full name'),
          SizedBox(height: 20),
          RoundedTextFormField(hintText: 'Enter your Email'),
          SizedBox(height: 20),
          RoundedTextFormField(
            hintText: 'Enter your password',
            obscureText: true,
          ),
          SizedBox(height: 20),
          RoundedTextFormField(
            hintText: 'Confirm Password',
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
