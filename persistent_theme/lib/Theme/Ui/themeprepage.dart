import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/theme/bloc/theme_bloc.dart';
import '../preferences/theme_preferences.dart';

class ThemePreferencesPage extends StatelessWidget {
  const ThemePreferencesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Preferences"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        itemCount: ThemePref.themePrefList.length,
        itemBuilder: (context, index) {
          // Get the name of the selected theme from the list
          final selectedTheme = ThemePref.themePrefList[index];

          return GestureDetector(
            onTap: () {
              // Dispatch a ChangeThemeEvent when a theme is selected
              BlocProvider.of<ThemeBloc>(context)
                  .add(ChangeThemeEvent(name: selectedTheme));
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black54),
                // Set the background color based on the selected theme
                color: appThemeData[selectedTheme]!.primaryColor,
              ),
              child: Center(
                child: Text(
                  selectedTheme,
                  // Apply text styling based on the selected theme
                  style: appThemeData[selectedTheme]!.textTheme.bodyMedium,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
