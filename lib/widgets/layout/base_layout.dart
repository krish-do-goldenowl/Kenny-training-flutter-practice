import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/widgets/button/custom_button.dart';

class BaseLayout extends StatelessWidget {
  final String buttonText;
  final VoidCallback onButtonPressed;
  final Widget content;

  const BaseLayout(
      {super.key,
      required this.buttonText,
      required this.onButtonPressed,
      required this.content});

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
                    child: SvgPicture.asset('assets/svgs/duplicate_circles.svg',
                        semanticsLabel: "Duplicate circles", width: 150),
                  ),
                ),
                content,
                CustomButton(
                  title: buttonText,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
