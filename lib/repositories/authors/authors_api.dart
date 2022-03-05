import 'package:books_store_app/models/author.dart';
import 'package:books_store_app/utils/consts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'authors_repository.dart';

class AuthorsAPI extends AuthorsRepository {
  var url = Uri.parse('https://librarybooksapp.herokuapp.com/data/authors/');

  @override
  Future<List<Author>> getAllAuthors() async {
    List<Author> authors = [];
    try {
      final response = await http.get(url);
      List<dynamic> jsonData = json.decode(response.body);
      jsonData.shuffle();
      authors = jsonData.map((author) => Author.fromJson(author)).toList();
    } catch (exception) {
      print('Exception: $exception');
    }
    return authors;
  }

  @override
  Future<void> addAuthor(Author author) async {
    print("LOG: Start addAuthors: Data: ${author.toJson()}");
    try {
      var response = await http.post(url, body: author.toJson());
      print('LOG: Response status: ${response.statusCode}');
      print('LOG: Response body: ${response.body}');

      if (response.statusCode == 201) {
        showToast(
            text: 'Author created successfully', state: ToastStates.SUCCESS);
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
