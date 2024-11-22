import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:myapp/src/router/coordinator.dart';
import 'package:myapp/src/theme/styles.dart';
import 'package:myapp/widgets/button/custom_button.dart';

class BaseLayout extends StatelessWidget {
  final String buttonText;
  final VoidCallback onButtonPressed;
  final Widget content;
  final String? currentView;

  const BaseLayout({
    super.key,
    required this.buttonText,
    required this.onButtonPressed,
    required this.content,
    this.currentView,
  });

  void _onSignInPressed() {
    AppCoordinator.showLoginScreen();
  }

  void _onSignUpPressed() {
    AppCoordinator.showRegisterScreen();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          color: Theme.of(context).splashColor,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SvgPicture.asset(
                      'assets/svgs/duplicate_circles.svg',
                      semanticsLabel: "Duplicate circles",
                      width: 150,
                    ),
                  ),
                ),
                content,
                Column(
                  children: [
                    CustomButton(
                      title: buttonText,
                      onButtonPressed: onButtonPressed,
                    ),
                    const SizedBox(height: 30),
                    if (currentView == 'register') ...[
                      RichText(
                        text: TextSpan(
                          style: AppStyles.normalText,
                          children: [
                            const TextSpan(
                              text: 'Already have an account? ',
                            ),
                            TextSpan(
                                text: 'Sign In',
                                style: AppStyles.highLightText,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = _onSignInPressed),
                          ],
                        ),
                      ),
                    ] else if (currentView == 'login') ...[
                      RichText(
                        text: TextSpan(
                          style: AppStyles.normalText,
                          children: [
                            const TextSpan(
                              text: "Don't have an account? ",
                            ),
                            TextSpan(
                                text: 'Sign Up',
                                style: AppStyles.highLightText,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = _onSignUpPressed),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
