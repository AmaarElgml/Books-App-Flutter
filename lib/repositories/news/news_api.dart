import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:books_store_app/models/news.dart';
import 'package:books_store_app/utils/consts.dart';
import 'news_repository.dart';

class NewsAPI extends NewsRepository {
  var url = Uri.parse('https://librarybooksapp.herokuapp.com/data/news/');

  @override
  Future<List<News>> getAllNews() async {
    List<News> news = [];
    try {
      final response = await http.get(url);
      List<dynamic> jsonData = json.decode(response.body);
      jsonData.shuffle();
      news = jsonData.map((news) => News.fromJson(news)).toList();
    } catch (exception) {
      print('Exception: $exception');
    }
    return news;
  }

  @override
  Future<void> addNews(News news) async {
    print("LOG: Start addNews: Data: ${news.toJson()}");
    try {
      var response = await http.post(url, body: news.toJson());
      print('LOG: Response status: ${response.statusCode}');
      print('LOG: Response body: ${response.body}');

      if (response.statusCode == 201) {
        showToast(
            text: 'News created successfully', state: ToastStates.SUCCESS);
        print("LOG: Supposed to be created");
        String id = json.decode(response.body)['id'];
        print('LOG: id: $id');
      } else
        showToast(
            text: '${response.statusCode}: Something wrong has happened',
            state: ToastStates.ERROR);
    } catch (e) {
      showToast(text: 'Exception: $e', state: ToastStates.ERROR);
    }
  }
}
