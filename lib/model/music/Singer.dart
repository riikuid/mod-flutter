class Singer {
  late int id;
  late String name;
  late String urlProfile;

  Singer({
    required this.id,
    required this.name,
    required this.urlProfile,
  });

  Singer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    urlProfile = json['url_profile'];
  }
}
