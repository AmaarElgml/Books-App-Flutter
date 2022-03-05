import 'package:books_store_app/models/book.dart';
import 'package:books_store_app/utils/consts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'books_repository.dart';

class BooksAPI extends BooksRepository {
  var url = Uri.parse('https://librarybooksapp.herokuapp.com/data/books/');

  @override
  Future<List<Book>> getAllBooks() async {
    List<Book> books = [];
    try {
      final response = await http.get(url);
      List<dynamic> jsonData = json.decode(response.body);
      jsonData.shuffle();
      books = jsonData.map((book) => Book.fromJson(book)).toList();
    } catch (exception) {
      print('Exception: $exception');
    }
    return books;
  }

  @override
  Future<void> addBook(Book book) async {
    print("LOG: Start addBook: Data: ${book.toJson()}");
    try {
      var response = await http.post(url, body: book.toJson());
      print('LOG: Response status: ${response.statusCode}');
      print('LOG: Response body: ${response.body}');

      if (response.statusCode == 201) {
        showToast(
            text: 'Book created successfully', state: ToastStates.SUCCESS);
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
