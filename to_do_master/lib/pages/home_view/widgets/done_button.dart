import 'package:flutter/material.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return SizedBox(
      width: 60,
      height: 35,
      child: Text(
        'Done!',
        style: theme.textTheme.titleMedium!.copyWith(
          color: const Color(0xff61E757),
        ),
      ),
    );
  }
}
