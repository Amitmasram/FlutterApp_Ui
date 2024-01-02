import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/controllers/api_controller.dart';
import 'package:netflix_clone/models/movies_modal.dart';
import 'package:netflix_clone/pages/details.dart';
import 'package:netflix_clone/widgets/searchbar.dart';
import 'package:flutter/src/widgets/image.dart' as img;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = 'all';
  int calculateStars(num rating) {
    return (rating / 2).round();
  }

  final searchQuery = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print('Search Page Query: $query');
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: const Icon(CupertinoIcons.line_horizontal_3_decrease,
              color: Colors.white),
          title: img.Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/7/7a/Logonetflix.png',
            height: kToolbarHeight - 25,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchQuery,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                                gapPadding: 0),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 20,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            alignLabelWithHint: true,
                          ),
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value) {
                            setState(() {
                              query = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          // context.read<SearchbarController>().changeFilter();
                          setState(() {
                            query = searchQuery.text;
                          });
                        },
                        child: Container(
                          height: 38,
                          width: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xffF62E1F),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            CupertinoIcons.search,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FutureBuilder<List<MoviesModal>>(
                    future: ApiController().getFilteredMovies(query),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<MoviesModal>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                            child: Text('Something went wrong'));
                      }
                      List<MoviesModal> movies = snapshot.data!;
                      return SingleChildScrollView(
                        child: Column(
                            children: movies
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Row(
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
                                              height: 190,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                gradient:
                                                    LinearGradient(colors: [
                                                  // grey gradient
                                                  Colors.black,
                                                  Colors.grey.shade900
                                                ]),
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                        const SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.show!.name.toString().length >
                                                      18
                                                  ? '${e.show!.name.toString().substring(0, 18)}...' // Display the first 11 characters and add ellipsis
                                                  : e.show!.name.toString(),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              overflow: TextOverflow
                                                  .ellipsis, // Handles overflow with ellipsis
                                            ),
                                            Row(children: [
                                              e.show?.rating?.average != null
                                                  ? Row(children: [
                                                      ...List.generate(
                                                        calculateStars(e
                                                            .show!
                                                            .rating!
                                                            .average!), // 3
                                                        (index) => const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2.0),
                                                            child: Icon(
                                                                Icons
                                                                    .star_purple500_outlined,
                                                                size: 15,
                                                                color: Colors
                                                                    .yellow)),
                                                      ),
                                                      ...List.generate(
                                                        5 -
                                                            calculateStars(e
                                                                .show!
                                                                .rating!
                                                                .average!), // 2
                                                        (index) => const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2.0),
                                                            child: Icon(
                                                                Icons
                                                                    .star_purple500_outlined,
                                                                size: 15,
                                                                color: Colors
                                                                    .grey)),
                                                      ),
                                                    ])
                                                  : Row(
                                                      children: List.generate(
                                                        5, // 2
                                                        (index) => const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2.0),
                                                            child: Icon(
                                                                Icons
                                                                    .star_purple500_outlined,
                                                                size: 15,
                                                                color: Colors
                                                                    .grey)),
                                                      ),
                                                    ),
                                              Text(
                                                '(${e.show!.rating!.average})',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ]),
                                            const SizedBox(height: 4),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              child: Row(
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                        e.show!.summary
                                                            .toString()
                                                            .trim(),
                                                        maxLines: 3,
                                                        style: const TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 12)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            SizedBox(
                                              width: size.width * 0.4,
                                              child: Wrap(
                                                children: e.show!.genres!
                                                    .map((e) => Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 10,
                                                                  right: 10),
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 5),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .yellow,
                                                                  width: 0.5)),
                                                          child: Text(e,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .yellow,
                                                                  fontSize:
                                                                      12)),
                                                        ))
                                                    .toList(),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                                .toList()),
                      );
                    })
              ],
            ),
          ),
        ));
  }
}
