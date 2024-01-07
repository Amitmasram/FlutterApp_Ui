import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/movie.dart';
import 'widget/movie_details.dart';

import 'widget/image_slider.dart';
import 'widget/movie_button.dart';
import 'widget/animated_pages.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pageController;
  List<Movie> movies = [];
  int currentIndex = 0;
  double pageValue = 0.0;

  @override
  void initState() {
    super.initState();
    movies = rawData
        .map(
          (data) => Movie(
            title: data["title"],
            index: data["index"],
            image: data["image"],
          ),
        )
        .toList();
    _pageController = PageController(
      initialPage: currentIndex,
      viewportFraction: 0.8,
    )..addListener(() {
        setState(() {
          pageValue = _pageController.page!;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final deviceWidth = MediaQuery.of(context).size.width;
    final reversedMovieList = movies.reversed.toList();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            Stack(
              children: reversedMovieList.map((movie) {
                return ImageSlider(
                  pageValue: pageValue,
                  image: movie.image,
                  index: movie.index - 1,
                );
              }).toList(),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.white,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.3, 0.8]),
              ),
            ),
            AnimatedPages(
              pageValue: pageValue,
              pageController: _pageController,
              pageCount: movies.length,
              onPageChangeCallback: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              child: (index, _) => MovieDetails(
                movies[index],
              ),
            ),
            const Positioned(
              bottom: 32.0,
              left: 0.0,
              right: 0.0,
              child: MovieButton(),
            ),
          ],
        ),
      ),
    );
  }
}
