import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mod_android/theme.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-movie');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 297 / 420,
            child: Container(
              // height: 222.7,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    "assets/example_poster.png",
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
            "James Bond: Makanan Adalah kesukaanku",
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
