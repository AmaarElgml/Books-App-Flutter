import 'package:books_store_app/models/news.dart';
import 'package:books_store_app/repositories/news/news_repository.dart';
import 'package:books_store_app/shared_view_models/news_view_model.dart';

class LatestNewsViewModel {
  NewsRepository? newsRepository;

  LatestNewsViewModel({this.newsRepository});

  Future<List<NewsViewModel>> fetchLatestNews() async {
    List<News> list = await newsRepository!.getAllNews();
    return list.map((news) => NewsViewModel(news: news)).toList();
  }
}
