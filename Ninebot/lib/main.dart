import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/onboarding.dart';

void main() {
  runApp(const NineBotUi());
}

// 🚀 Welcome to Flutter UIs!
// 🌐 Connect with us on social media:
//    - Twitter: https://twitter.com/AmitMasram10
//    - Instagram: https://www.instagram.com/skytech_28/
//    - LinkedIn: https://www.linkedin.com/feed/
//    - YouTube: https://www.youtube.com/channel/UC95U3IDgISWVeyqo4CGBywQ
// 💻 Explore the code and have fun building beautiful UIs with Flutter!
class NineBotUi extends StatelessWidget {
  const NineBotUi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith()),
          useMaterial3: true),
      home: const OnboardingPage(),
    );
  }
}
