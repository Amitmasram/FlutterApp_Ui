import 'dart:convert';

import 'package:netflix_clone/models/movies_modal.dart';
import 'package:http/http.dart' as http;

class ApiController {
  static const String BASE_URL = "https://api.tvmaze.com/search/shows?q=all";
  Future<List<MoviesModal>> getMovies() async {
    List<MoviesModal> movies = [];
    var response = await http.get(Uri.parse(BASE_URL));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      for (var item in jsonData) {
        movies.add(MoviesModal.fromJson(item));
      }
    }
    print('Movies: $movies');
    return movies;
  }

  Future<List<MoviesModal>> getFilteredMovies(String query) async {
    List<MoviesModal> movies = [];
    var response = await http
        .get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      for (var item in jsonData) {
        movies.add(MoviesModal.fromJson(item));
      }
    }
    print('Movies: $movies');
    return movies;
  }
}
