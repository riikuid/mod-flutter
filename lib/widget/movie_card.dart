import 'package:flutter/material.dart';
import 'package:mod_android/api_address.dart';
import 'package:mod_android/model/movie/Movie.dart';
import 'package:mod_android/pages/movie/detail_movie_page.dart';
import 'package:mod_android/theme.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => DetailMoviePage(
                  movie: movie,
                )),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 297 / 420,
            child: Container(
              // height: 222.7,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    "$baseUrl/${movie.urlPoster}",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            movie.title,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: primaryTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
