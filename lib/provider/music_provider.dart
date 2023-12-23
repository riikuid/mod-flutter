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

  static List<Music> getMusicList() {
    var jsonMusicList = [
      {
        "id": 1,
        "title": "Take A Chance With Me",
        "singers_id": 2,
        "duration": 214.73,
        "url_music": "assets/music/niki.mp3",
        "url_poster": "assets/example_article.png",
        "deleted_at": null,
        "created_at": "2023-11-20T03:34:09.000000Z",
        "updated_at": "2023-11-20T03:34:09.000000Z",
        "singer": {
          "id": 2,
          "name": "NIKI",
          "url_profile":
              "public/music/LOltBY7obMmR9OVkhoBBlp8yBq5ZhSmL857a1CYM.jpg",
          "deleted_at": null,
          "created_at": "2023-11-20T03:33:36.000000Z",
          "updated_at": "2023-11-20T03:33:36.000000Z"
        }
      },
      {
        "id": 2,
        "title": "Hati-Hati di Jalan",
        "singers_id": 1,
        "duration": 214.73,
        "url_music": "assets/music/hati-hati-di-jalan.mp3",
        "url_poster": "assets/example_home.png",
        "deleted_at": null,
        "created_at": "2023-11-20T03:34:53.000000Z",
        "updated_at": "2023-11-20T03:34:53.000000Z",
        "singer": {
          "id": 1,
          "name": "Tulus",
          "url_profile":
              "public/music/hOocWR8ngfcX1qiESqabiDhkjsq2MwcNc546Snc7.jpg",
          "deleted_at": null,
          "created_at": "2023-11-20T03:30:18.000000Z",
          "updated_at": "2023-11-20T03:30:18.000000Z"
        }
      },
      {
        "id": 3,
        "title": "Interaksi",
        "singers_id": 1,
        "duration": 174.26,
        "url_music": "assets/music/interaksi.mp3",
        "url_poster": "assets/example_music.png",
        "deleted_at": null,
        "created_at": "2023-11-27T01:52:21.000000Z",
        "updated_at": "2023-11-27T01:52:21.000000Z",
        "singer": {
          "id": 1,
          "name": "Tulus",
          "url_profile":
              "public/music/hOocWR8ngfcX1qiESqabiDhkjsq2MwcNc546Snc7.jpg",
          "deleted_at": null,
          "created_at": "2023-11-20T03:30:18.000000Z",
          "updated_at": "2023-11-20T03:30:18.000000Z"
        }
      },
      {
        "id": 4,
        "title": "Langit Abu-Abu",
        "singers_id": 1,
        "duration": 218.93,
        "url_music": "assets/music/langit-abu-abu.mp3",
        "url_poster": "assets/example_poster.png",
        "deleted_at": null,
        "created_at": "2023-11-27T01:54:38.000000Z",
        "updated_at": "2023-11-27T01:54:38.000000Z",
        "singer": {
          "id": 1,
          "name": "Tulus",
          "url_profile":
              "public/music/hOocWR8ngfcX1qiESqabiDhkjsq2MwcNc546Snc7.jpg",
          "deleted_at": null,
          "created_at": "2023-11-20T03:30:18.000000Z",
          "updated_at": "2023-11-20T03:30:18.000000Z"
        }
      }
    ];

    return jsonMusicList.map((json) => Music.fromJson(json)).toList();
  }
}
