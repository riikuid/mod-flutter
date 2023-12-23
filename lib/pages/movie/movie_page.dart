import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:mod_android/theme.dart';
import 'package:mod_android/widget/category_card.dart';
import 'package:mod_android/widget/movie_card.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  String selectedCategory = "Semua";

  void _onCategoryCardTap(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget categorySection() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CategoryCard(
              selected: selectedCategory == "Semua",
              category: "Semua",
              onTap: (isSelected) {
                _onCategoryCardTap("Semua");
              },
            ),
            CategoryCard(
              selected: selectedCategory == "Sci-Fi",
              category: "Sci-Fi",
              onTap: (isSelected) {
                _onCategoryCardTap("Sci-Fi");
              },
            ),
            CategoryCard(
              selected: selectedCategory == "Aksi",
              category: "Aksi",
              onTap: (isSelected) {
                _onCategoryCardTap("Aksi");
              },
            ),
            CategoryCard(
              selected: selectedCategory == "Animasi",
              category: "Animasi",
              onTap: (isSelected) {
                _onCategoryCardTap("Animasi");
              },
            ),
            CategoryCard(
              selected: selectedCategory == "Horror",
              category: "Horror",
              onTap: (isSelected) {
                _onCategoryCardTap("Horror");
              },
            ),
            CategoryCard(
              selected: selectedCategory == "Komedi",
              category: "Komedi",
              onTap: (isSelected) {
                _onCategoryCardTap("Komedi");
              },
            ),
            CategoryCard(
              selected: selectedCategory == "Misteri",
              category: "Misteri",
              onTap: (isSelected) {
                _onCategoryCardTap("Misteri");
              },
            ),
            CategoryCard(
              selected: selectedCategory == "Romantis",
              category: "Romantis",
              onTap: (isSelected) {
                _onCategoryCardTap("Romantis");
              },
            ),
            CategoryCard(
              selected: selectedCategory == "Thriller",
              category: "Thriller",
              onTap: (isSelected) {
                _onCategoryCardTap("Thriller");
              },
            ),
            CategoryCard(
              selected: selectedCategory == "Kuatir",
              category: "Kuatir",
              onTap: (isSelected) {
                _onCategoryCardTap("Kuatir");
              },
            ),
            CategoryCard(
              selected: selectedCategory == "Naliko",
              category: "Naliko",
              onTap: (isSelected) {
                _onCategoryCardTap("Naliko");
              },
            ),
            CategoryCard(
              selected: selectedCategory == "Science",
              category: "Science",
              onTap: (isSelected) {
                _onCategoryCardTap("Science");
              },
            ),
          ],
        ),
      );
    }

    Widget header() {
      return Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.movie,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Pilihan Film",
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

    Widget movieList() {
      return ResponsiveGridList(
        listViewBuilderOptions: ListViewBuilderOptions(
          padding: const EdgeInsets.only(bottom: 20),
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          shrinkWrap: true,
        ),
        minItemWidth: 149.3,
        verticalGridSpacing: 20,
        children: const [
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard(),
        ],
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
      body: Container(
        decoration: BoxDecoration(
          color: backgroundPrimary,
        ),
        padding: const EdgeInsets.only(
          // top: 10,
          right: 20,
          left: 20,
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              const SizedBox(
                height: 45,
              ),
              header(),
              const SizedBox(
                height: 25,
              ),
              categorySection(),
              const SizedBox(
                height: 25,
              ),
              movieList(),
            ],
          ),
        ),
      ),
    );
  }
}
