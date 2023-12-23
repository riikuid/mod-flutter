import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mod_android/api_address.dart';
import 'package:mod_android/model/movie/MovieGenre.dart';

class GenreService {
  Future<List<MovieGenre>> getGenres() async {
    var url = apiGenre;
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<MovieGenre> articles = [];

      for (var item in data) {
        articles.add(MovieGenre.fromJson(item));
      }
      return articles;
    } else {
      throw Exception('Failed to get genres!');
    }
  }
}
