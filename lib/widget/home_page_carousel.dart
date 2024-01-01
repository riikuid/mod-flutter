import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mod_android/api_address.dart';
import 'package:mod_android/model/article/Article.dart';
import 'package:mod_android/pages/article/detail_article_page.dart';
import 'package:mod_android/theme.dart';

class HomePageCarousel extends StatefulWidget {
  // const HomePageCarousel({super.key});
  final List<Article> articles;

  HomePageCarousel({required this.articles});

  @override
  State<HomePageCarousel> createState() => HomePageCarouselState();
}

class HomePageCarouselState extends State<HomePageCarousel> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(12.0),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            decoration: BoxDecoration(
              color: backgroundSecondary,
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            child: CarouselSlider(
              disableGesture: true,
              options: CarouselOptions(
                height: double.infinity,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlay: widget.articles.length > 1 ? true : false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: widget.articles
                  .map(
                    (item) => GestureDetector(
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
                      child: Container(
                        decoration: BoxDecoration(
                          color: backgroundSecondary,
                          image: DecorationImage(
                            image: NetworkImage(
                              "$baseUrl/${item.thumbanail}",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(20, 0, 40, 55),
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent, // Transparan di tengah
                                Colors.transparent, // Transparan di tengah
                                baseShadowGradient.withOpacity(
                                    0.5), // Warna hitam dengan transparansi 50%
                                baseShadowGradient.withOpacity(
                                    0.8), // Warna hitam dengan transparansi 50%
                                baseShadowGradient.withOpacity(
                                    1), // Warna hitam dengan transparansi 50%
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                item.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: primaryTextStyle.copyWith(
                                  fontSize: 25,
                                  fontWeight: bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        // width: 805,
                        // height: 374,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20.0,
              left: 20,
            ),
            child: DotsIndicator(
              dotsCount:
                  widget.articles.isNotEmpty ? widget.articles.length : 1,
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
            ),
          ),
        ],
      ),
    );
  }
}
