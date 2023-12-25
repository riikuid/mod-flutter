import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:mod_android/model/article/Article.dart';
import 'package:mod_android/pages/article/detail_article_page.dart';
import 'package:mod_android/provider/article_provider.dart';
import 'package:mod_android/theme.dart';
import 'package:mod_android/widget/article_card.dart';
import 'package:mod_android/widget/article_page_carousel.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late List<Article> articleList = [];
  late List<Article> articleCarousel = [];

  @override
  void initState() {
    super.initState();
    // Fetch articles once when the widget is initialized
    Provider.of<ArticleProvider>(context, listen: false)
        .getArticles()
        .then((_) {
      articleList =
          Provider.of<ArticleProvider>(context, listen: false).articles;
      articleCarousel = articleList.take(4).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.menu_book_rounded,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Pilihan Artikel Lain",
                style: primaryTextStyle.copyWith(
                  fontWeight: semibold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.white.withOpacity(0.5),
          ),
        ],
      );
    }

    Widget articleListR() {
      return ResponsiveGridList(
        listViewBuilderOptions: ListViewBuilderOptions(
          padding: const EdgeInsets.only(bottom: 20),
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          shrinkWrap: true,
        ),
        minItemWidth: 233.48,
        verticalGridSpacing: 20,
        children: articleList
            .map(
              (article) => ArticleCard(
                article: article,
              ),
            )
            .toList(),
      );
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actionsIconTheme: const IconThemeData(
            color: Colors.white,
            size: 25,
          ),
          actions: const [
            Icon(
              Icons.volume_up_rounded,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.brightness_6_outlined,
            ),
            SizedBox(
              width: 20,
            ),
          ],
          title: Image.asset(
            'assets/kai_logo.png',
            height: 20,
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg_primary.png"),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.home,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: backgroundPrimary,
        body: FutureBuilder(
          future: Provider.of<ArticleProvider>(context, listen: false)
              .getArticles(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show a loading indicator or circular progress while waiting for data
              return Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error loading data'),
              );
            } else {
              return Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: backgroundPrimary,
                ),
                padding: const EdgeInsets.only(
                  // top: 10,
                  right: 20,
                  left: 20,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    // scrollDirection: Axis.vertical,
                    children: [
                      const SizedBox(
                        height: 34,
                      ),
                      ArticlePageCarousel(articles: articleCarousel),
                      const SizedBox(
                        height: 35,
                      ),
                      header(),
                      const SizedBox(
                        height: 25,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      articleListR(),
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }
}
