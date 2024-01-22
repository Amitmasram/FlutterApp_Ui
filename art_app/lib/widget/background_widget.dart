import 'package:flutter/material.dart';

import '../data/art.dart';
import '../model/art.dart';

class BackgroundWidget extends StatelessWidget {
  final PageController controller;

  const BackgroundWidget({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => PageView.builder(
        reverse: true,
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        itemBuilder: (context, index) {
          final artist = art[index];

          return buildBackground(art: artist);
        },
        itemCount: art.length,
      );

  Widget buildBackground({required Artist art}) => Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(art.imageUrl, fit: BoxFit.cover),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.4, 0.8],
                colors: [
                  const Color.fromARGB(255, 248, 199, 3).withOpacity(0.01),
                  Colors.white
                ],
              ),
            ),
          )
        ],
      );
}
