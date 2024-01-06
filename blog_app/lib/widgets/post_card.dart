import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/post.dart';
import '../screens/article_screen.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleScreen(
              post: post,
            ),
          )),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              color: Color(0x1a5282FF),
            )
          ],
        ),
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Hero(
                tag: post.imageFileName,
                child: Image.network(
                  post.imageFileName,
                  width: 120,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      post.caption,
                      style: const TextStyle(
                        color: kprimaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      post.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          CupertinoIcons.hand_thumbsup,
                          size: 16,
                          color: kgreyColor,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          post.likes,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(width: 16),
                        const Icon(
                          CupertinoIcons.clock,
                          size: 16,
                          color: kgreyColor,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          post.time,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Expanded(
                            child: Container(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            post.isBookmarked
                                ? CupertinoIcons.bookmark_fill
                                : CupertinoIcons.bookmark,
                            size: 16,
                            color: kgreyColor,
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
