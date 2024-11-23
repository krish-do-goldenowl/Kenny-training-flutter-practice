import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/features/register/logic/register_cubit.dart';
import 'package:myapp/widgets/forms/rounded_text_input.dart';

class RegisterForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const RegisterForm({
    super.key,
    required this.formKey,
  });

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    final registerCubit = context.read<RegisterCubit>();

    fullNameController =
        TextEditingController(text: registerCubit.state.fullName);
    emailController = TextEditingController(text: registerCubit.state.email);
    passwordController =
        TextEditingController(text: registerCubit.state.password);
    confirmPasswordController =
        TextEditingController(text: registerCubit.state.confirmPassword);

    fullNameController.addListener(() {
      registerCubit.updateFullName(fullNameController.text);
    });
    emailController.addListener(() {
      registerCubit.updateEmail(emailController.text);
    });
    passwordController.addListener(() {
      registerCubit.updatePassword(passwordController.text);
    });
    confirmPasswordController.addListener(() {
      registerCubit.updateConfirmPassword(confirmPasswordController.text);
    });
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          RoundedTextFormField(
            hintText: 'Enter your full name',
            controller: fullNameController,
          ),
          const SizedBox(height: 20),
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
          const SizedBox(height: 20),
          RoundedTextFormField(
            hintText: 'Confirm Password',
            obscureText: true,
            controller: confirmPasswordController,
          ),
        ],
      ),
    );
  }
}
