import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mod_android/api_address.dart';
import 'package:mod_android/model/movie/Movie.dart';

class MovieService {
  Future<List<Movie>> getMovies() async {
    var url = apiMovie;
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<Movie> movies = [];

      for (var item in data) {
        movies.add(Movie.fromJson(item));
      }
      return movies;
    } else {
      throw Exception('Failed to get movies!');
    }
  }
}
