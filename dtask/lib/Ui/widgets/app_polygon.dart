import 'package:flutter/material.dart';
import 'package:morphable_shape/morphable_shape.dart';

class AppPolygon extends StatelessWidget {
  const AppPolygon({Key? key, required this.child, required this.radius})
      : super(key: key);
  final Widget child;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final size = radius * 2;
    return Container(
        height: size +2,
        width: size + 2,
        decoration: ShapeDecoration(
            color: scheme.outline.withOpacity(2*60/radius),
            shape: PolygonShapeBorder(
                sides: 6,
                cornerStyle: CornerStyle.rounded,
                cornerRadius: 40.toPercentLength)),
        child: Center(
          child: Container(
            height: size,
            width: size,
            decoration: ShapeDecoration(
                color: theme.scaffoldBackgroundColor,
                shape: PolygonShapeBorder(
                    sides: 6,
                    cornerStyle: CornerStyle.rounded,
                    cornerRadius: 40.toPercentLength)),
            child: Center(
              child: child,
            ),
          ),
        ));
  }
}
