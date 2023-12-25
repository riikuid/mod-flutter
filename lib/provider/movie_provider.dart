import 'package:flutter/material.dart';
import 'package:mod_android/model/movie/Movie.dart';
import 'package:mod_android/services/movie_service.dart';

class MovieProvider with ChangeNotifier {
  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  set movies(List<Movie> movies) {
    _movies = movies;
    notifyListeners();
  }

  Future<void> getMovies() async {
    try {
      List<Movie> movies = await MovieService().getMovies();
      _movies = movies;
    } catch (e) {
      print(e);
    }
  }
}
