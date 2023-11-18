import 'package:dtask/Ui/onboarding_screen.dart';
import 'package:dtask/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final base = ThemeData.light().textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          shadowColor: lightColorScheme.outline.withOpacity(0.2),
          scaffoldBackgroundColor: lightColorScheme.surface,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle.dark),
          textTheme: base.copyWith(
              displayMedium: const TextStyle(fontWeight: FontWeight.bold),
              titleMedium: const TextStyle(fontWeight: FontWeight.bold),
              headlineSmall:
                  const TextStyle(fontWeight: FontWeight.bold).apply()),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  foregroundColor: lightColorScheme.outline)),
          colorScheme: lightColorScheme,
          useMaterial3: true,
          primarySwatch: Colors.lightGreen,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: lightColorScheme.secondary,
            foregroundColor: lightColorScheme.onSecondary,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          ))),
      home: const OnboardingPage(),
    );
  }
}
