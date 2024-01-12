import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/user.dart';
import 'panel_header_widget.dart';
import 'stats_widget.dart';

class PanelWidget extends StatelessWidget {
  final User user;
  final VoidCallback onClickedPanel;
  final VoidCallback onClickedFollowing;

  const PanelWidget({
    required this.user,
    required this.onClickedPanel,
    required this.onClickedFollowing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          StatsWidget(user: user),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: buildProfile(),
            ),
          ),
        ],
      );

  Widget buildProfile() => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onClickedPanel,
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              PanelHeaderWidget(
                user: user,
                onClickedFollowing: onClickedFollowing,
              ),
              const SizedBox(height: 24),
              Expanded(child: buildProfileDetails(user)),
            ],
          ),
        ),
      );

  Widget buildProfileDetails(
    User user,
  ) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.bio,
            style: GoogleFonts.sarabun(fontSize: 16, color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Text(
            'Hobbies',
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 17),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: user.urlPhotos.asMap().entries.map((entry) {
                final index = entry.key;
                final url = entry.value;
                final padding = index == 0 ? 0.0 : 20.0;

                return Container(
                  margin: EdgeInsets.only(left: padding),
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(url),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      );
}
