import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:myapp/src/router/coordinator.dart';
import 'package:myapp/widgets/layout/base_layout.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      buttonText: 'Get started',
      onButtonPressed: () => AppCoordinator.showRegisterScreen(),
      content: Column(
        children: [
          SvgPicture.asset('assets/svgs/splash_screen_bg.svg',
              semanticsLabel: "Splash screen bg image", width: 200),
          const SizedBox(height: 50),
          const Text(
            'Get things with TODs',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          const SizedBox(
            width: 200,
            child: Text(
              'Lorem ipsum dolor sit amet consectetur. Eget sit nec et euismod. Consequat urna quam felis interdum quisque. Malesuada adipiscing tristique ut eget sed.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
