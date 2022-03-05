import 'package:books_store_app/style/app_theme.dart';
import 'package:books_store_app/utils/consts.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard(
      {required this.name,
      required this.poster,
      this.height,
      this.backColor,
      this.titleMaxLength = 16});

  final String name;
  final String poster;
  final double? height;
  final Color? backColor;
  final int titleMaxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 220,
        padding: EdgeInsets.only(left: defSpacing * 0.75),
        child: Card(
            elevation: 0,
            color: backColor ?? Theme.of(context).scaffoldBackgroundColor,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(defSpacing / 2),
                child: Image.network(poster, height: 200.0, fit: BoxFit.cover),
              ),
              Padding(
                  padding: EdgeInsets.all(defSpacing / 4),
                  child: Text(
                      name.length > titleMaxLength
                          ? name.substring(0, titleMaxLength)
                          : name,
                      style: backColor == null
                          ? kBookNameStyle
                          : kBookNameStyle.copyWith(color: Colors.white)))
            ])));
  }
}
