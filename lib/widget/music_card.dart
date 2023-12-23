import 'package:gradient_borders/gradient_borders.dart';
import 'package:mod_android/api_address.dart';
import 'package:mod_android/model/music/Music.dart';
import 'package:mod_android/theme.dart';
import 'package:flutter/material.dart';

class MusicCard extends StatefulWidget {
  final bool selected;
  final int musicId;
  final Music music;
  final Function(bool) onTap;

  MusicCard(
      {required this.selected,
      required this.musicId,
      required this.onTap,
      required this.music});

  @override
  _MusicCardState createState() => _MusicCardState();
}

class _MusicCardState extends State<MusicCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap(true);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: widget.selected
            ? BoxDecoration(
                gradient: primaryGradient,
                border: GradientBoxBorder(
                  gradient: primaryGradient,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              )
            : BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                border: GradientBoxBorder(
                  gradient: primaryGradient,
                  width: 1.5,
                ),
              ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.8),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      "$baseUrl/${widget.music.urlPoster}",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.music.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semibold,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              widget.music.singer.name,
              style: primaryTextStyle.copyWith(
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
