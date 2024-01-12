import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FollowButtonWidget extends StatelessWidget {
  final bool isFollowing;
  final VoidCallback onClicked;

  const FollowButtonWidget({
    required this.isFollowing,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onClicked,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          width: isFollowing ? 150 : 125,
          height: 50,
          child: isFollowing ? buildShrinked() : buildStretched(),
        ),
      );

  Widget buildStretched() => Container(
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              'Follow',
              style: GoogleFonts.barlowCondensed(
                color: Colors.white,
                letterSpacing: 1,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );

  Widget buildShrinked() => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.amber),
        child: Center(
          child: FittedBox(
            child: Text(
              'Following',
              style: GoogleFonts.barlowCondensed(
                letterSpacing: 1,
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
}
