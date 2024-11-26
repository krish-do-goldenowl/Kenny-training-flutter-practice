import 'package:flutter/material.dart';
import 'package:myapp/src/config/constants/enums.dart';
import 'package:myapp/src/theme/styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onButtonPressed;
  final AuthStatus? isLoading;

  const CustomButton(
      {super.key,
      required this.title,
      required this.onButtonPressed,
      this.isLoading});

  @override
  Widget build(BuildContext context) {
    final isLoading = this.isLoading == AuthStatus.loading;

    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
        onPressed: isLoading ? null : onButtonPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                title,
                style: AppStyles.semiBoldText.copyWith(
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
