import 'package:flutter/material.dart';

import '../constants.dart';

class AboutProfileBox extends StatelessWidget {
  const AboutProfileBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            width: double.infinity,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: kbackgroundColor.withOpacity(0.8),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 65,
                      height: 80,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: kprimaryColor,
                            width: 2.5,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          "assets/img/stories/story_5.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("@joviedan"),
                        const SizedBox(height: 5),
                        Text(
                          "Jovi Daniel",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "UX Designer",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(color: kprimaryColor),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "About me",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  "Madison Blackstone is a director of user experience design, with experience managing global teams.",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: kgreyColor),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 50,
            right: 50,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: kprimaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xff2151CD),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "52",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .apply(color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Posts",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "250",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .apply(color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Following",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "4.5K",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .apply(color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Followers",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
