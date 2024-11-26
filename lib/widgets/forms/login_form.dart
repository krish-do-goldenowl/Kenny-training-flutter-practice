import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/features/login/logic/login_cubit.dart';
import 'package:myapp/widgets/forms/rounded_text_input.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const LoginForm({super.key, required this.formKey});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    final loginCubit = context.read<LoginCubit>();

    emailController = TextEditingController(text: loginCubit.state.email);
    passwordController = TextEditingController(text: loginCubit.state.password);

    emailController.addListener(() {
      loginCubit.updateEmail(emailController.text);
    });

    passwordController.addListener(() {
      loginCubit.updatePassword(passwordController.text);
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          RoundedTextFormField(
            hintText: 'Enter your Email',
            controller: emailController,
          ),
          const SizedBox(height: 20),
          RoundedTextFormField(
            hintText: 'Enter your password',
            obscureText: true,
            controller: passwordController,
          ),
        ],
      ),
    );
  }
}
