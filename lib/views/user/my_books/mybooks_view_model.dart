import 'package:books_store_app/models/book.dart';
import 'package:books_store_app/repositories/books/books_repository.dart';
import 'package:books_store_app/shared_view_models/book_view_model.dart';

class MyBooksViewModel {
  BooksRepository? booksRepository;

  MyBooksViewModel(this.booksRepository);

  Future<List<BookViewModel>> fetchCurrentlyReadingBooks() async {
    List<Book> list = await booksRepository!.getAllBooks();
    return list.map((book) => BookViewModel(book: book)).toList();
  }

  Future<List<BookViewModel>> fetchWantsToReadBooks() async {
    List<Book> list = await booksRepository!.getAllBooks();
    return list.map((book) => BookViewModel(book: book)).toList();
  }

  Future<List<BookViewModel>> fetchReadBooks() async {
    List<Book> list = await booksRepository!.getAllBooks();
    return list.map((book) => BookViewModel(book: book)).toList();
  }

  Future<List<BookViewModel>> fetchFavouriteBooks() async {
    List<Book> list = await booksRepository!.getAllBooks();
    return list.map((book) => BookViewModel(book: book)).toList();
  }
}
