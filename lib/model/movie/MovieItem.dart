class MovieItem {
  late int id;
  late String title;
  late String urlThumbnail;
  late int duration;
  late String urlVideo;

  MovieItem({
    required this.id,
    required this.title,
    required this.urlThumbnail,
    required this.duration,
    required this.urlVideo,
  });

  MovieItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    urlThumbnail = json['thumbnail'];
    duration = json['duration'];
    urlVideo = json['url'];
  }
}
