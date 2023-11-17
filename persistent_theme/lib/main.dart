import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Theme/Ui/screen.dart';
import 'Theme/bloc/theme/bloc/theme_bloc.dart';
import 'Theme/preferences/theme_preferences.dart';

void main() {
  runApp(const MyApp());
}

// 🚀 Welcome to Flutter UIs!
// 🌐 Connect with us on social media:
//    - Twitter: https://twitter.com/AmitMasram10
//    - Instagram: https://www.instagram.com/skytech_28/
//    - LinkedIn: https://www.linkedin.com/feed/
//    - YouTube: https://www.youtube.com/channel/UC95U3IDgISWVeyqo4CGBywQ
// 💻 Explore the code and have fun building beautiful UIs with Flutter!

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Provide the ThemeBloc at the root level of the widget tree
        BlocProvider(
          create: (context) => ThemeBloc()..add(const GetPreservedThemeEvent()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is ThemeLoaded) {
            // Use the theme from the state if it's loaded
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: state.themeData,
              home: const ThemeUi(),
            );
          } else if (state is PreservedThemeLoaded) {
            // Use the preserved theme if available
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: _switchTheme(state.name),
              home: const ThemeUi(),
            );
          } else {
            // Use a default theme if neither loaded nor preserved
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
              home: const ThemeUi(),
            );
          }
        },
      ),
    );
  }

  // Helper function to switch between predefined themes
  ThemeData _switchTheme(String name) {
    switch (name) {
      case ThemePref.lightTheme:
        return appThemeData[ThemePref.lightTheme]!;
      case ThemePref.darkTheme:
        return appThemeData[ThemePref.darkTheme]!;
      case ThemePref.deepOrangeThemeLight:
        return appThemeData[ThemePref.deepOrangeThemeLight]!;
      case ThemePref.deepPurpleThemeLight:
        return appThemeData[ThemePref.deepPurpleThemeLight]!;
      default:
        // Return a default theme if the specified theme is not found
        return ThemeData(primarySwatch: Colors.blue);
    }
  }
}
