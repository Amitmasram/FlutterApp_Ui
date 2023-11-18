import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(this.value, {super.key, this.size});
  final double? size;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SvgPicture.asset(
        value,
        height: size ?? 24,
        width: size ?? 24,
      ),
    );
  }
}
