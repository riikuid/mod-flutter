import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mod_android/model/movie/MovieGenre.dart';
import 'package:mod_android/provider/genre_provider.dart';
import 'package:mod_android/provider/movie_provider.dart';
import 'package:mod_android/theme.dart';
import 'package:mod_android/widget/category_card.dart';
import 'package:mod_android/widget/movie_card.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  late bool _isLoading;

  void initState() {
    // await Provider.of<GenreProvider>(context, listen: false).getGenres();
    loadGenres();
    super.initState();
  }

  loadGenres() async {
    setState(() {
      _isLoading = false;
    });
    await Provider.of<GenreProvider>(context, listen: false).getGenres();
    await Provider.of<MovieProvider>(context, listen: false).getMovies();
    setState(() {
      _isLoading = true;
    });
  }

  String selectedCategory = "All";
  String genreFilter = "All";

  void _onCategoryCardTap(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    GenreProvider genreProvider = Provider.of<GenreProvider>(context);
    MovieProvider movieProvider = Provider.of<MovieProvider>(context);

    Widget categorySection() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CategoryCard(
              selected: selectedCategory == "All",
              category: "All",
              onTap: (isSelected) {
                _onCategoryCardTap("All");
                setState(() {
                  genreFilter = "All";
                });
              },
            ),
            ...genreProvider.genres
                .map(
                  (item) => CategoryCard(
                    selected: selectedCategory == item.name,
                    category: item.name,
                    onTap: (isSelected) {
                      setState(() {
                        genreFilter = item.name;
                      });
                      _onCategoryCardTap(item.name);
                    },
                  ),
                )
                .toList(),
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
        children: [
          ...movieProvider.movies
              .map(
                (item) => MovieCard(
                  movie: item,
                ),
              )
              .where((item) => genreFilter == "All"
                  ? item.movie.id > 0
                  : item.movie.genre.name == genreFilter)
              .toList(),
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
      backgroundColor: backgroundPrimary,
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
              FutureBuilder(
                future: movieProvider.getMovies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Show a loading indicator or circular progress while waiting for data
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: CupertinoActivityIndicator(),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error loading data'),
                    );
                  } else {
                    return movieList();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
