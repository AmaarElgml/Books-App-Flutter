import 'package:books_store_app/models/author.dart';

abstract class AuthorsRepository {
  Future<List<Author>> getAllAuthors();
  Future<void> addAuthor(Author author);
}
