import 'package:flutter/material.dart';
import 'package:mod_android/model/article/Article.dart';
import 'package:mod_android/services/article_service.dart';

class ArticleProvider with ChangeNotifier {
  List<Article> _articles = [];
  List<Article> get articles => _articles;

  set articles(List<Article> articles) {
    _articles = articles;
    notifyListeners();
  }

  Future<void> getArticles() async {
    try {
      List<Article> articles = await ArticleService().getArticles();
      _articles = articles;
    } catch (e) {
      print(e);
    }
  }
}
