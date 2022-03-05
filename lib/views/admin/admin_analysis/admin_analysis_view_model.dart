import 'package:flutter/material.dart';

class AdminsAnalysisViewModel {
  final String pageTitle = 'Analysis';

  List<Color> topBooksColors = [
    Color(0xFFEE2727),
    Color(0xFF26E5FF),
    Color(0xFFFFCF26),
    Colors.brown
  ];

  final List<double> topBooksRadius = [25, 22, 19, 16];

  List<Color> topAuthorsColors = [
    Color(0xFFEE2727),
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.pink,
    Color(0xFFFFCF26),
    Colors.brown,
  ];

  final List<double> topAuthorsRadius = [30, 26, 22, 18, 14, 10];
}
