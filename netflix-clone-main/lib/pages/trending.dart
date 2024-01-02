import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movies_modal.dart';
import 'package:netflix_clone/pages/details.dart';

import '../controllers/api_controller.dart';
import 'package:flutter/src/widgets/image.dart' as img;

class TrendingPage extends StatefulWidget {
  const TrendingPage({super.key});

  @override
  State<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  @override
  void initState() {
    super.initState();
  }

  int calculateStars(num rating) {
    return (rating / 2).round();
  }

  List<MoviesModal> otherMovies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<List<MoviesModal>>(
        future: ApiController().getMovies(),
        builder:
            (BuildContext context, AsyncSnapshot<List<MoviesModal>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }
          List<MoviesModal> movies = snapshot.data!;
          print('Movies sub list: ${movies.sublist(1, 7)}');
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Trending Now',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                  movie: movies[0], moreLikeThis: movies)));
                        },
                        child: Hero(
                          tag: movies[0].show!.id.toString(),
                          child: Container(
                            height: 190,
                            width: 140,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                // grey gradient
                                Colors.black,
                                Colors.grey.shade900
                              ]),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    movies[0].show!.image!.original.toString()),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movies[0].show!.name.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(children: [
                            ...List.generate(
                              calculateStars(movies[0].show!.rating!.average!),
                              (index) => const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(Icons.star_purple500_outlined,
                                      size: 15, color: Colors.yellow)),
                            ),
                            ...List.generate(
                              5 -
                                  calculateStars(
                                      movies[0].show!.rating!.average!),
                              (index) => const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(Icons.star_purple500_outlined,
                                      size: 15, color: Colors.grey)),
                            ),
                            Text(
                              '(${movies[0].show!.rating!.average})',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ]),
                          const SizedBox(height: 4),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                      movies[0].show!.summary.toString().trim(),
                                      maxLines: 3,
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 12)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: movies[0]
                                .show!
                                .genres!
                                .map((e) => Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: Colors.yellow,
                                              width: 0.5)),
                                      child: Text(e,
                                          style: const TextStyle(
                                              color: Colors.yellow,
                                              fontSize: 12)),
                                    ))
                                .toList(),
                          )
                        ],
                      )
                    ],
                  )

                  // recommedned Now
                  ,
                  const SizedBox(height: 24),
                  const Text('Recommended For You',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: movies
                            .sublist(1, 7)
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailsPage(
                                                          movie: e,
                                                          moreLikeThis:
                                                              movies)));
                                        },
                                        child: Hero(
                                          tag: e.show!.id.toString(),
                                          child: Container(
                                            height: 150,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                // grey gradient
                                                Colors.black,
                                                Colors.grey.shade900
                                              ]),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10)),
                                              image: DecorationImage(
                                                image: NetworkImage(e
                                                    .show!.image!.original
                                                    .toString()),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: 120,
                                        child: Text(
                                          e.show!.name.toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                          e.show!.genres!.join(', ').toString(),
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12)),
                                      e.show?.rating?.average != null
                                          ? Row(children: [
                                              ...List.generate(
                                                calculateStars(e.show!.rating!
                                                    .average!), // 3
                                                (index) => const Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: Icon(
                                                        Icons
                                                            .star_purple500_outlined,
                                                        size: 15,
                                                        color: Colors.yellow)),
                                              ),
                                              ...List.generate(
                                                5 -
                                                    calculateStars(e.show!
                                                        .rating!.average!), // 2
                                                (index) => const Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: Icon(
                                                        Icons
                                                            .star_purple500_outlined,
                                                        size: 15,
                                                        color: Colors.grey)),
                                              ),
                                            ])
                                          : Row(
                                              children: List.generate(
                                                5, // 2
                                                (index) => const Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: Icon(
                                                        Icons
                                                            .star_purple500_outlined,
                                                        size: 15,
                                                        color: Colors.grey)),
                                              ),
                                            ),
                                    ],
                                  ),
                                ))
                            .toList()),
                  ),
                  const SizedBox(height: 24),
                  const Text('Comedy Movies',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: movies
                            .where((element) =>
                                element.show!.genres!.contains('Comedy'))
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailsPage(
                                                          movie: e,
                                                          moreLikeThis:
                                                              movies)));
                                        },
                                        child: Container(
                                          height: 150,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              // grey gradient
                                              Colors.black,
                                              Colors.grey.shade900
                                            ]),
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10)),
                                            image: DecorationImage(
                                              image: NetworkImage(e
                                                  .show!.image!.original
                                                  .toString()),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: 120,
                                        child: Text(
                                          e.show!.name.toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                          e.show!.genres!.join(', ').toString(),
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12)),
                                      e.show?.rating?.average != null
                                          ? Row(children: [
                                              ...List.generate(
                                                calculateStars(e.show!.rating!
                                                    .average!), // 3
                                                (index) => const Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: Icon(
                                                        Icons
                                                            .star_purple500_outlined,
                                                        size: 15,
                                                        color: Colors.yellow)),
                                              ),
                                              ...List.generate(
                                                5 -
                                                    calculateStars(e.show!
                                                        .rating!.average!), // 2
                                                (index) => const Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: Icon(
                                                        Icons
                                                            .star_purple500_outlined,
                                                        size: 15,
                                                        color: Colors.grey)),
                                              ),
                                            ])
                                          : Row(
                                              children: List.generate(
                                                5, // 2
                                                (index) => const Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: Icon(
                                                        Icons
                                                            .star_purple500_outlined,
                                                        size: 15,
                                                        color: Colors.grey)),
                                              ),
                                            ),
                                    ],
                                  ),
                                ))
                            .toList()),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
