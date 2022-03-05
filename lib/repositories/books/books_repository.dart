import 'package:books_store_app/models/book.dart';

abstract class BooksRepository {
  Future<List<Book>> getAllBooks();
  Future<void> addBook(Book book);

}
