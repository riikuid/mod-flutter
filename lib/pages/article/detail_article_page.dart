import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mod_android/api_address.dart';
import 'package:mod_android/model/article/Article.dart';
import 'package:mod_android/theme.dart';

class DetailArticlePage extends StatelessWidget {
  final Article article;
  const DetailArticlePage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
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
          child: Image.asset(
            "assets/icon_back.png",
            height: 25,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: backgroundPrimary,
        ),
        padding: const EdgeInsets.symmetric(
          // top: 10,
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 500,
                decoration: BoxDecoration(
                  color: backgroundPrimary,
                  image: DecorationImage(
                    image: NetworkImage(
                      "$baseUrl/${article.thumbanail}",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                article.title,
                textAlign: TextAlign.justify,
                style: primaryTextStyle.copyWith(
                  fontWeight: semibold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/kai_logo2.png',
                    height: 28,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    DateFormat('EEEE, dd MMMM yyyy', 'id').format(
                      article.createdAt,
                    ),
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                article.description,
                textAlign: TextAlign.justify,
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
