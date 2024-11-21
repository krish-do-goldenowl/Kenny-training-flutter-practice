import 'package:flutter/material.dart';
import 'package:myapp/widgets/layout/base_layout.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      buttonText: 'Register',
      onButtonPressed: () {},
      content: const Column(
        children: [
          Column(
            children: [
              Text(
                'Welcome to Onboard!',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 200,
                child: Text("Let's help to meet up your tasks.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        fontSize: 13)),
              ),
            ],
          )
        ],
      ),
      currentView: 'register',
    );
  }
}
