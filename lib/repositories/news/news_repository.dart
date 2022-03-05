import 'package:books_store_app/models/news.dart';

abstract class NewsRepository {
  Future<List<News>> getAllNews();

  Future<void> addNews(News news);
}
