import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final String settingOptionTitle, selectedOption;
  final GestureTapCallback onClicked;

  const SettingsItem({
    super.key,
    required this.settingOptionTitle,
    required this.selectedOption,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 38),
          child: Text(
            settingOptionTitle,
            style: theme.textTheme.titleMedium,
          ),
        ),
        GestureDetector(
          onTap: () {
            onClicked();
          },
          child: Container(
            margin:
                const EdgeInsets.only(top: 17, left: 56, right: 37, bottom: 17),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            width: mediaQuery.width,
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: theme.primaryColor,
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedOption,
                  style: theme.textTheme.bodyLarge,
                ),
                Icon(
                  Icons.arrow_drop_down_outlined,
                  color: theme.colorScheme.onSecondary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
