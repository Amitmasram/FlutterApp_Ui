import 'package:flutter/material.dart';

import '../model/art.dart';

class ArtCardWidget extends StatelessWidget {
  final Artist art;

  const ArtCardWidget({
    required this.art,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            children: [
              Expanded(child: buildImage(art: art)),
              const SizedBox(height: 4),
              Text(
                art.artName,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 10),
              buildGenre(art: art),
              const SizedBox(height: 10),
              buildRating(art: art),
              const Text(
                '...',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );

  Widget buildImage({required Artist art}) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          child: Image.asset(art.imageUrl, fit: BoxFit.cover),
        ),
      );

  Widget buildGenre({required Artist art}) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: art.genres
            .map((genre) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 117, 117, 117)),
                        borderRadius: BorderRadius.circular(15)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Text(genre,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15)),
                  ),
                ))
            .toList(),
      );

  Widget buildRating({required Artist art}) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            art.rating.toStringAsFixed(1),
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(width: 10),
          ...List.generate(
            art.stars,
            (index) =>
                const Icon(Icons.star_rate, size: 22, color: Colors.orange),
          ),
        ],
      );
}
