import 'package:flutter/material.dart';
import 'themeprepage.dart';

class ThemeUi extends StatelessWidget {
  const ThemeUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Theme App',
          style: TextStyle(
            fontSize: 20, // Adjust the font size as needed
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to the ThemePreferencesPage when settings button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ThemePreferencesPage(),
                ),
              );
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: const Center(
        child: Text(
          "Play with Themes",
          style: TextStyle(
            fontSize: 30, // Adjust the font size as needed
            fontWeight: FontWeight.bold, // Adjust the font weight as needed
            // Adjust the text color as needed
          ),
        ),
      ),
    );
  }
}
