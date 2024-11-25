import 'package:flutter/material.dart';
import 'package:myapp/src/theme/styles.dart';

class RoundedTextFormField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final bool? obscureText;

  const RoundedTextFormField(
      {super.key,
      required this.hintText,
      this.validator,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              AppStyles.smallText.copyWith(color: const Color(0xCC000000)),
          border: InputBorder.none,
        ),
        obscureText: obscureText!,
        validator: validator,
      ),
    );
  }
}
