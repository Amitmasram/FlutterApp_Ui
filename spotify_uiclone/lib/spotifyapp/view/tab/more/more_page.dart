import 'package:flutter/material.dart';

import '../widgets/custom_title.dart';
import 'widget/activity_card.dart';
import 'widget/more_title.dart';
import 'widget/play_list_card.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 54,
            ),
            const MoreTitle(title: 'Your Library'),
            const PlayListCard(),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () {},
                  child: const Text('See all',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ))),
            ),
            const SizedBox(height: 8),
            const CustomTitle(title: 'Your Activities'),
            const SizedBox(
              height: 16,
            ),
            const ActivityCard(title: 'Liked Songs', icon: Icons.favorite),
            Divider(
              color: Colors.grey.shade800,
            ),
            const ActivityCard(title: 'Followed Artist', icon: Icons.people),
            Divider(
              color: Colors.grey.shade800,
            ),
            const ActivityCard(title: 'Followed Podcast', icon: Icons.mic),
          ],
        ),
      ),
    );
  }
}
