class Article {
  late int id;
  late String title;
  late String description;
  late String thumbanail;
  late DateTime createdAt;

  Article({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbanail,
    required this.createdAt,
  });

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    thumbanail = json['thumbnail'];
    createdAt = DateTime.parse(json['created_at']);
  }
}
