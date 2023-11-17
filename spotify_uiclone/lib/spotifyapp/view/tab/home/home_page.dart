import 'package:flutter/material.dart';

import '../widgets/custom_title.dart';
import '../widgets/welcome_title.dart';
import 'widgets/artist.dart';
import 'widgets/top_music.dart';
import 'widgets/weekly_music_list.dart';
import 'widgets/weekly_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 54,
            ),
            WelcomeTitle(
              title: 'Good Morning',
            ),
            SizedBox(
              height: 32,
            ),
            WeeklyTitle(),
            SizedBox(
              height: 24,
            ),
            WeeklyMusicList(),
            SizedBox(
              height: 16,
            ),
            CustomTitle(title: 'Your Top Mixes'),
            SizedBox(
              height: 12,
            ),
            TopMusic(),
            SizedBox(
              height: 12,
            ),
            CustomTitle(title: 'Suggested artists'),
            SizedBox(
              height: 24,
            ),
            Artist()
          ],
        ),
      ),
    );
  }
}
