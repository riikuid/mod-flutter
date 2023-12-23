import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mod_android/api_address.dart';
import 'package:mod_android/model/article/Article.dart';
import 'package:mod_android/pages/article/detail_article_page.dart';
import 'package:mod_android/theme.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => DetailArticlePage(
                  article: article,
                )),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 233 / 150,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    "$baseUrl/${article.thumbanail}",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                DateFormat('EEEE, dd MMMM yyyy', 'id').format(
                  article.createdAt,
                ),
                style: primaryTextStyle.copyWith(
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                  // fontWeight: semibold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            article.title,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semibold,
            ),
          )
        ],
      ),
    );
  }
}
