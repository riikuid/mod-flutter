import 'package:flutter/material.dart';
import 'package:mod_android/theme.dart';

class MovieProperty extends StatelessWidget {
  final String text;
  const MovieProperty({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            blueGradientHorizontal.colors[0]
                .withOpacity(0.8), // Warna pertama dengan transparansi 20%
            blueGradientHorizontal.colors[1]
                .withOpacity(0.5), // Warna kedua dengan transparansi 50%
          ],
          stops: blueGradientHorizontal.stops,
          begin: blueGradientHorizontal.begin,
          end: blueGradientHorizontal.end,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(50.0),
        ),
      ),
      child: Text(
        text,
        style: primaryTextStyle.copyWith(
            fontSize: 13,
            fontWeight: light,
            color: Colors.white.withOpacity(0.7)),
      ),
    );
  }
}
