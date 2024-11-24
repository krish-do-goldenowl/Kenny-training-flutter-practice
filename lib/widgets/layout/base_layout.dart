import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/gen/assets.gen.dart';
import 'package:myapp/src/config/constants/enums.dart';

import 'package:myapp/src/theme/styles.dart';
import 'package:myapp/widgets/button/custom_button.dart';

class BaseLayout extends StatelessWidget {
  final String buttonText;
  final VoidCallback onButtonPressed;
  final Widget content;
  final CurrentView? currentView;
  final VoidCallback? onTapPressed;
  final AuthStatus? isLoading;

  const BaseLayout(
      {super.key,
      required this.buttonText,
      required this.onButtonPressed,
      required this.content,
      this.currentView,
      this.onTapPressed,
      this.isLoading});

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
                      Assets.svgs.duplicateCircles,
                      semanticsLabel: "Duplicate circles",
                      width: 150,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: content,
                  ),
                ),
                Column(
                  children: [
                    CustomButton(
                        title: buttonText,
                        onButtonPressed: onButtonPressed,
                        isLoading: isLoading),
                    const SizedBox(height: 30),
                    if (currentView == CurrentView.register) ...[
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
                                  ..onTap = onTapPressed),
                          ],
                        ),
                      ),
                    ] else if (currentView == CurrentView.login) ...[
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
                                  ..onTap = onTapPressed),
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
