import 'package:gradient_borders/gradient_borders.dart';
import 'package:mod_android/theme.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  final bool selected;
  final String category;
  final Function(bool) onTap;

  CategoryCard(
      {required this.selected, required this.category, required this.onTap});

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap(true);
      },
      child: Container(
        margin: EdgeInsets.only(
          right: 15,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 5,
        ),
        decoration: widget.selected
            ? BoxDecoration(
                gradient: blueGradient,
                border: GradientBoxBorder(
                  gradient: blueGradient,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              )
            : BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
                border: GradientBoxBorder(
                  gradient: blueGradient,
                  width: 1.5,
                ),
              ),
        child: Text(
          widget.category,
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
