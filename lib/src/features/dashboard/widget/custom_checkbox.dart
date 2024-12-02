import 'package:flutter/material.dart';
import 'package:myapp/src/theme/colors.dart';

class CustomCheckbox extends StatelessWidget {
  final VoidCallback onTap;
  final bool value;
  const CustomCheckbox({super.key, required this.onTap, required this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 17,
        height: 17,
        decoration: BoxDecoration(
          color: value ? AppColors.textHighLight : Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
    );
  }
}
