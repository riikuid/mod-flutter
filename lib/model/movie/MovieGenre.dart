class MovieGenre {
  late int id;
  late String name;

  MovieGenre({
    required this.id,
    required this.name,
  });

  MovieGenre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
