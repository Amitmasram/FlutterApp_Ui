import 'package:blog_app/models/story.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../screens/profile_screen.dart';

class StoryItem extends StatelessWidget {
  final Story story;
  final int index;
  const StoryItem({
    super.key,
    required this.story,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(
          left: index == 0 ? 20 : 10,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                story.isViewed
                    ? SizedBox(
                        height: 70,
                        width: 70,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          color: Colors.red,
                          padding: const EdgeInsets.all(7),
                          dashPattern: const [5, 3],
                          strokeWidth: 2,
                          radius: const Radius.circular(25),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(story.imageFileName),
                          ),
                        ),
                      )
                    : Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: const LinearGradient(
                            colors: [Colors.red, Colors.green],
                            begin: Alignment.topCenter,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              story.imageFileName,
                            ),
                          ),
                        ),
                      ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    story.iconFileName,
                    height: 20,
                    width: 20,
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  story.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
