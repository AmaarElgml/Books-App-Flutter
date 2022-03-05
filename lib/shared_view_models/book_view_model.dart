import 'package:books_store_app/models/book.dart';

class BookViewModel {
  Book? book;

  BookViewModel({this.book});

  get name => book?.name;

  get authorId => book?.authorId;

  get background => book?.background;

  get poster => book?.poster;

  get price => book?.price;

// get category => book?.category;
}
