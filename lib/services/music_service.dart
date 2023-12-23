import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mod_android/api_address.dart';
import 'package:mod_android/model/music/Music.dart';

class MusicService {
  Future<List<Music>> getMuiscs() async {
    var url = apiMusic;
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<Music> musics = [];

      for (var item in data) {
        musics.add(Music.fromJson(item));
      }
      return musics;
    } else {
      throw Exception('Failed to get articles!');
    }
  }
}
