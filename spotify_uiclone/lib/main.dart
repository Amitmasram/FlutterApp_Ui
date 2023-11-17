import 'package:flutter/material.dart';

import 'package:flutterapp_ui/spotifyapp/view/get_started/get_started_page.dart';

void main() {
  runApp(const SpotifyClone());
}

// 🚀 Welcome to Flutter UIs!
// 🌐 Connect with us on social media:
//    - Twitter: https://twitter.com/AmitMasram10
//    - Instagram: https://www.instagram.com/skytech_28/
//    - LinkedIn: https://www.linkedin.com/feed/
//    - YouTube: https://www.youtube.com/channel/UC95U3IDgISWVeyqo4CGBywQ
// 💻 Explore the code and have fun building beautiful UIs with Flutter!
class SpotifyClone extends StatelessWidget {
  const SpotifyClone({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
      ),
      home: const GetStartedPage(),
    );
  }
}
