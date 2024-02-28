import 'package:flutter/material.dart';

class UnselectedOption extends StatelessWidget {
  final String unselectedOptionTitle;

  const UnselectedOption({super.key, required this.unselectedOptionTitle});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: theme.colorScheme.background.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        unselectedOptionTitle,
        style: theme.textTheme.bodyLarge,
      ),
    );
  }
}
