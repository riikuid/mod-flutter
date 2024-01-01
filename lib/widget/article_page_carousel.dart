import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mod_android/api_address.dart';
import 'package:mod_android/model/article/Article.dart';
import 'package:mod_android/pages/article/detail_article_page.dart';
import 'package:mod_android/theme.dart';

class ArticlePageCarousel extends StatefulWidget {
  final List<Article> articles;

  ArticlePageCarousel({required this.articles});

  @override
  _ArticlePageCarouselState createState() => _ArticlePageCarouselState();
}

class _ArticlePageCarouselState extends State<ArticlePageCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 310,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CarouselSlider(
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: widget.articles
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => DetailArticlePage(
                                  article: item,
                                )),
                          ),
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              height: 310,
                              decoration: BoxDecoration(
                                color: backgroundSecondary,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "$baseUrl/${item.thumbanail}",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 28,
                                    fontWeight: semibold,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/kai_logo2.png",
                                      height: 20,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      DateFormat('EEEE, dd MMMM yyyy', 'id')
                                          .format(
                                        item.createdAt,
                                      ),
                                      style: primaryTextStyle.copyWith(
                                        fontWeight: regular,
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  item.description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: light,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        widget.articles.isNotEmpty
            ? DotsIndicator(
                dotsCount: widget.articles.length,
                position: _currentIndex,
                decorator: DotsDecorator(
                  size: Size(7, 7),
                  activeSize: Size(25, 7),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        5.0), // Radius sudut dot untuk bentuk persegi
                  ),
                  color: Colors.grey,
                  activeColor: Color(0xffe04d6e),
                  spacing: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 10,
                  ),
                ),
              )
            : SizedBox(
                height: 5,
              ),
      ],
    );
  }
}
