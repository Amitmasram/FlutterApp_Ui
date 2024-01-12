import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/user.dart';

class StatsWidget extends StatelessWidget {
  final User user;

  const StatsWidget({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildStatistic('Followers', user.countFollowers),
            buildStatistic('Posts', user.countPosts),
            buildStatistic('Following', user.countFollowing),
          ],
        ),
      );

  Widget buildStatistic(String text, int value) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$value',
            style: GoogleFonts.readexPro(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: GoogleFonts.readexPro(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      );
}
