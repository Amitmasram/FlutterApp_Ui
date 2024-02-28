import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String title;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final int maxLines;
  final Widget? suffixIcon;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    required this.title,
    required this.textEditingController,
    this.labelText,
    this.validator,
    this.maxLines = 1,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return TextFormField(
      controller: textEditingController,
      validator: validator,
      obscureText: obscureText,
      maxLines: maxLines,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: theme.colorScheme.onSecondary,
        labelText: labelText,
        labelStyle: theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColor),
        hintText: title,
        hintStyle: theme.textTheme.bodyLarge!.copyWith(
          color: theme.colorScheme.onSecondary.withOpacity(0.5),
        ),
      ),
      style: theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onSecondary,
      )
    );
  }
}
