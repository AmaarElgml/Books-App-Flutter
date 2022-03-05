import 'package:books_store_app/models/author.dart';
import 'package:books_store_app/models/book.dart';
import 'package:books_store_app/repositories/authors/authors_repository.dart';
import 'package:books_store_app/repositories/books/books_repository.dart';
import '../../../shared_view_models/author_view_model.dart';
import '../../../shared_view_models/book_view_model.dart';

class HomeViewModel {
  BooksRepository? booksRepository;
  AuthorsRepository? authorsRepository;

  HomeViewModel({this.booksRepository, this.authorsRepository});

  Future<List<BookViewModel>> fetchAllBooks() async {
    List<Book> list = await booksRepository!.getAllBooks();
    return list.map((book) => BookViewModel(book: book)).toList();
  }

  Future<List<AuthorViewModel>> fetchAllAuthors() async {
    List<Author> list = await authorsRepository!.getAllAuthors();
    return list.map((author) => AuthorViewModel(author: author)).toList();
  }

// Future<List<AuthorViewModel>> fetchAllCategories() async {
//   List<Author> list = await authorsRepository!.getAllAuthors();
//   return list.map((author) => AuthorViewModel(author: author)).toList();
// }
}
