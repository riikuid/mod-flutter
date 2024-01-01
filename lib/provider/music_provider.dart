import 'package:flutter/material.dart';
import 'package:mod_android/model/music/Music.dart';
import 'package:mod_android/services/music_service.dart';

class MusicProvider with ChangeNotifier {
  List<Music> _musics = [];
  List<Music> get musics => _musics;

  set musics(List<Music> musics) {
    _musics = musics;
    notifyListeners();
  }

  Future<void> getMusics() async {
    try {
      List<Music> musics = await MusicService().getMuiscs();
      _musics = musics;
    } catch (e) {
      print(e);
    }
  }
}
