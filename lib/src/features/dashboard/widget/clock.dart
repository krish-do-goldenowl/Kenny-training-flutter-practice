import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/gen/assets.gen.dart';

class CurrentClock extends StatelessWidget {
  const CurrentClock({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement clock ui later, use svg as placeholder for now
    return Container(
      width: 130,
      height: 130,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipOval(
        child: SvgPicture.asset(
          Assets.svgs.clock,
          semanticsLabel: "Clock",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
