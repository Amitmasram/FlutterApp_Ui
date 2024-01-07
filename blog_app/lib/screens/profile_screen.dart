import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/post.dart';
import '../widgets/about_profile_box.dart';
import '../widgets/post_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Text(
                      "Profile",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const AboutProfileBox(),
              const SizedBox(height: 40),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "My Posts",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.grid_view,
                            color: kprimaryColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.list),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    for (var post in posts) PostCard(post: post),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
