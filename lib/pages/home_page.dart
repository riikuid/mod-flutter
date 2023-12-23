import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mod_android/model/article/Article.dart';
import 'package:mod_android/pages/article/detail_article_page.dart';
import 'package:mod_android/provider/article_provider.dart';
import 'package:mod_android/theme.dart';
import 'package:mod_android/widget/car_status_card.dart';
import 'package:mod_android/widget/car_status_layout.dart';
import 'package:mod_android/widget/home_page_carousel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Article> articleList;
  late List<Article> articleCarousel = [];

  int _currentIndex = 0;

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
    return Scaffold(
      backgroundColor: backgroundPrimary,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/bg_primary.png',
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hallo",
                            style: hallo.copyWith(
                              fontSize: 38,
                            ),
                          ),
                          Text(
                            "SELAMAT DATANG",
                            style: primaryTextStyle.copyWith(
                              fontSize: 17.26,
                              fontWeight: semibold,
                            ),
                          )
                        ],
                      ),
                      Image.asset("assets/kai_logo.png")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 43,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: backgroundPrimary,
                    ),
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      top: 50,
                      bottom: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: FutureBuilder(
                              future: Provider.of<ArticleProvider>(context,
                                      listen: false)
                                  .getArticles(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  // Show a loading indicator or circular progress while waiting for data
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (snapshot.hasError) {
                                  // Show an error message if there's an error
                                  return Center(
                                    child: Text('Error loading data'),
                                  );
                                } else {
                                  return HomePageCarousel(
                                      articles: articleCarousel);
                                }
                              }),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/movie');
                                },
                                child: AspectRatio(
                                  aspectRatio: 1.3693693694 / 1,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "assets/button_movie.png",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/music');
                                },
                                child: AspectRatio(
                                  aspectRatio: 1.3693693694 / 1,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "assets/button_music.png",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "/article");
                                },
                                child: AspectRatio(
                                  aspectRatio: 1.3693693694 / 1,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "assets/button_kai.png",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 110,
            ),
            child: CarStatusLayout(),
          ),
        ],
      ),
    );
  }
}
