import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/post.dart';

class ArticleScreen extends StatefulWidget {
  final Post post;
  const ArticleScreen({super.key, required this.post});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: kprimaryColor,
        foregroundColor: Colors.white,
        label: const Text("2.1k"),
        icon: const Icon(Icons.thumb_up),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                leadingWidth: 100,
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  iconSize: 30,
                  icon: const Icon(CupertinoIcons.chevron_back),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: IconButton(
                      onPressed: () {},
                      iconSize: 35,
                      icon: const Icon(Icons.more_horiz),
                    ),
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.post.title,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                "assets/img/stories/story_5.jpg",
                                fit: BoxFit.cover,
                                width: 50,
                                height: 65,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Richard Gervain",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  "2m ago",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.send_outlined,
                                color: Colors.amber[900],
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.bookmark_outline,
                                color: Colors.amber[900],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                    child: Hero(
                      tag: widget.post.imageFileName,
                      child: Image.network(
                        widget.post.imageFileName,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                    child: Text(
                      widget.post.description,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 10, 30),
                    child: Text(
                      '${widget.post.description}Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ligula nisi, blandit ullamcorper convallis vel, rhoncus ut nisi. Duis tincidunt faucibus elementum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla et purus risus. In pellentesque aliquet turpis, sit amet facilisis nisi aliquet ut. Vestibulum vel elit interdum est dictum cursus eu eget arcu. Praesent eget eros lorem. Nullam placerat odio sodales elit lobortis imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vivamus id congue sem. Sed luctus leo et ligula ultricies ultrices.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ligula nisi, blandit ullamcorper convallis vel, rhoncus ut nisi. Duis tincidunt faucibus elementum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla et purus risus. In pellentesque aliquet turpis, sit amet facilisis nisi aliquet ut. Vestibulum vel elit interdum est dictum cursus eu eget arcu. Praesent eget eros lorem. Nullam placerat odio sodales elit lobortis imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vivamus id congue sem. Sed luctus leo et ligula ultricies ultrices.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
                ]),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 110,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
