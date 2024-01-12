import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/user.dart';
import 'follow_button_widget.dart';

class PanelHeaderWidget extends StatelessWidget {
  final User user;
  final VoidCallback onClickedFollowing;

  const PanelHeaderWidget({
    required this.user,
    required this.onClickedFollowing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(child: buildUser()),
          FollowButtonWidget(
            isFollowing: user.isFollowing!,
            onClicked: onClickedFollowing,
          ),
        ],
      );

  Widget buildUser() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name,
            style: GoogleFonts.merriweather(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            user.location,
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 17),
          ),
        ],
      );
}
