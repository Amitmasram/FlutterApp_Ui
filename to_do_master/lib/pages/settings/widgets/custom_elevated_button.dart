import 'package:flutter/material.dart';

class CustomELevatedButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Function onTap;

  const CustomELevatedButton({
    super.key,
    required this.text,
    this.textStyle,
    this.borderColor,
    this.backgroundColor,
    this.foregroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;

    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? theme.colorScheme.secondary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: borderColor ?? theme.primaryColor,
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        foregroundColor: foregroundColor ?? theme.colorScheme.onSecondary,
        minimumSize: Size(mediaQuery.width / 1.28, 50),
        maximumSize: Size(mediaQuery.width / 1.28, 50),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: textStyle ?? theme.textTheme.bodyLarge,
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: theme.colorScheme.onSecondary,
            size: 18,
          ),
        ],
      ),
    );
  }
}
