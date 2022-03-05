import 'package:books_store_app/models/author.dart';

class AuthorViewModel {
  Author? author;

  AuthorViewModel({this.author});

  get name => author?.name;

  get image => author?.image;

  get booksNum => author?.booksNum;
}
