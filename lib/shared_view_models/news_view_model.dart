import 'package:books_store_app/models/news.dart';

class NewsViewModel {
  News? news;

  NewsViewModel({this.news});

  get title => news?.title;

  get body => news?.body;

  get date => news?.date;

  get type => news?.type;
}
