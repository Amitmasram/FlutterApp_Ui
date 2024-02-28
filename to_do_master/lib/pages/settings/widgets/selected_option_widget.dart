import 'package:flutter/material.dart';

class SelectedOption extends StatelessWidget {
  final String selectedOptionTitle;
  const SelectedOption({super.key, required this.selectedOptionTitle});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.onSecondary,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            selectedOptionTitle,
            style: theme.textTheme.bodyLarge,
          ),
          Icon(
            Icons.check,
            color: theme.colorScheme.onSecondary,
          ),
        ],
      ),
    );
  }
}
