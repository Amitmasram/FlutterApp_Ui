import 'package:flutter/material.dart';

import '../models/post.dart';
import '../models/story.dart';
import '../widgets/category_slider.dart';
import '../widgets/post_card.dart';
import '../widgets/story_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hi, Raheel!",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        "assets/img/icons/notification.png",
                        width: 35,
                        height: 35,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Explore today's",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => StoryItem(
                    story: stories[index],
                    index: index,
                  ),
                  itemCount: stories.length,
                ),
              ),
              const SizedBox(height: 20),
              const CategorySlider(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest News",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("More"),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) => PostCard(
                  post: posts[index],
                ),
                itemCount: posts.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
