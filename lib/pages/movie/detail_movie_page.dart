import 'package:flutter/material.dart';
import 'package:mod_android/api_address.dart';
import 'package:mod_android/model/movie/Movie.dart';
import 'package:mod_android/pages/movie/play_movie_page.dart';
import 'package:mod_android/theme.dart';
import 'package:mod_android/widget/movie_property.dart';

class DetailMoviePage extends StatelessWidget {
  final Movie movie;
  const DetailMoviePage({super.key, required this.movie});
  // const DetailMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        actionsIconTheme: const IconThemeData(
          color: Colors.white,
          size: 25,
        ),
        shadowColor: Colors.transparent,
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
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/icon_back.png",
            height: 25,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "$baseUrl/${movie.item.urlThumbnail}",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                baseMovieGradientColor
                    .withOpacity(1), // 20px transparan di atas
                baseMovieGradientColor
                    .withOpacity(0.5), // Warna hitam dengan transparansi 50%
                Colors.transparent, // Transparan di tengah
                baseMovieGradientColor
                    .withOpacity(0.5), // Warna hitam dengan transparansi 50%
                baseMovieGradientColor
                    .withOpacity(0.8), // Warna hitam dengan transparansi 50%
                baseMovieGradientColor
                    .withOpacity(1), // 100px transparan di bawah
                baseMovieGradientColor
                    .withOpacity(1), // 100px transparan di bawah
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        MovieProperty(text: movie.genre.name),
                        MovieProperty(text: movie.releaseYear),
                        MovieProperty(text: "${movie.item.duration} menit"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      movie.title,
                      style: primaryTextStyle.copyWith(
                        fontSize: 48,
                        fontWeight: semibold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      movie.description,
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 4),
                              blurRadius: 5.0)
                        ],
                        gradient: const LinearGradient(
                          colors: [Color(0xff6652EE), Color(0xffe04d6e)],
                          stops: [0.0, 0.9],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        color: Colors.deepPurple.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          minimumSize:
                              MaterialStateProperty.all(const Size(0, 50)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          // elevation: MaterialStateProperty.all(3),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () {
                          print("$baseUrl/${movie.item.urlVideo}");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => PlayMoviePage(
                                    urlVideo: "$baseUrl/${movie.item.urlVideo}",
                                  )),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.play_arrow_rounded,
                              size: 30,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Play Now",
                              style: primaryTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: semibold,
                                // fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
