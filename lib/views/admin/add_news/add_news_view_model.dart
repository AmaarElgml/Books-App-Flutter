import 'package:flutter/material.dart';
import 'package:books_store_app/models/news.dart';
import 'package:books_store_app/repositories/news/news_api.dart';

class AddNewsViewModel {
  final String titlePage = 'Add News';
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final TextEditingController typeController = TextEditingController();
  late String title, body, date, type;

  List<String> types = [
    'Undefined',
    'Completed',
    'Knowledge',
    'Good',
    'Bad',
  ];

  void onSubmitClicked() {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      NewsAPI()
        ..addNews(News(
            title: title,
            body: body,
            date: date,
            type: type));
    }
  }
}
