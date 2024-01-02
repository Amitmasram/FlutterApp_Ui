import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:netflix_clone/models/movies_modal.dart';
import 'package:readmore/readmore.dart';

// ignore: must_be_immutable
class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required this.movie, required this.moreLikeThis});
  MoviesModal movie;
  List<MoviesModal> moreLikeThis;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print('Movie: ${movie.score}');
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Hero(
            tag: movie.show!.id.toString(),
            child: Container(
              clipBehavior: Clip.none,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(movie.show!.image!.original!),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 20,
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                  ),
                  //center play button
                ],
              ),
            ),
          ),
          Positioned(
            top: 270,
            left: size.width / 2 - 30,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.red,
                size: 40,
              ),
            ),
          ),
          Positioned(
            top: 350,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.add,
                  color: Color(0xffF62E1F),
                ),
                Column(
                  children: [
                    Text(
                      movie.show!.name!.length > 18
                          ? '${movie.show!.name!.substring(0, 20).toUpperCase()}...' // Display the first 11 characters in uppercase and add ellipsis
                          : movie.show!.name!.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow
                          .ellipsis, // Handles overflow with ellipsis
                    ),
                    Text(
                      movie.show!.genres!.join(' • '),
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.share,
                  color: Color(0xffF62E1F),
                ),
              ],
            ),
          ),
          Positioned(
            top: 420,
            left: 20,
            right: 20,
            child: ReadMoreText(movie.show!.summary!,
                trimLines: 6,
                trimMode: TrimMode.Line,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
                textAlign: TextAlign.start),
          ),
          const Positioned(
            top: 570,
            left: 20,
            child: Text('More Like This',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          Positioned(
            top: 600,
            left: 20,
            child: SizedBox(
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    ...moreLikeThis
                        .where((element) => element.show!.genres!
                            .contains(movie.show!.genres![0]))
                        .skip(1)
                        .toList()
                        .map((e) => Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 120,
                              width: 100,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  // grey gradient
                                  Colors.black,
                                  Colors.grey.shade900
                                ]),
                                image: DecorationImage(
                                  image: NetworkImage(e.show!.image!.original!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ))
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
