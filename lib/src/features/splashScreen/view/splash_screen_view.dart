import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/gen/assets.gen.dart';

import 'package:myapp/src/router/coordinator.dart';
import 'package:myapp/src/theme/styles.dart';
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
          SvgPicture.asset(Assets.svgs.splashScreenBg,
              semanticsLabel: "Splash screen bg image", width: 200),
          const SizedBox(height: 50),
          const Text('Get things with TODs', style: AppStyles.boldText),
          const SizedBox(height: 20),
          const SizedBox(
            width: 200,
            child: Text(
                'Lorem ipsum dolor sit amet consectetur. Eget sit nec et euismod. Consequat urna quam felis interdum quisque. Malesuada adipiscing tristique ut eget sed.',
                textAlign: TextAlign.center,
                style: AppStyles.smallText),
          ),
        ],
      ),
    );
  }
}
