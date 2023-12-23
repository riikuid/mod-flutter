import 'package:flutter/material.dart';
import 'package:mod_android/model/movie/MovieGenre.dart';
import 'package:mod_android/services/genre_service.dart';

class GenreProvider with ChangeNotifier {
  List<MovieGenre> _genres = [];
  List<MovieGenre> get genres => _genres;

  set genres(List<MovieGenre> genres) {
    _genres = genres;
    notifyListeners();
  }

  Future<void> getGenres() async {
    try {
      List<MovieGenre> genres = await GenreService().getGenres();
      _genres = genres;
    } catch (e) {
      print(e);
    }
  }
}
