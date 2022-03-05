import 'package:books_store_app/models/book.dart';
import 'package:books_store_app/repositories/books/books_api.dart';
import 'package:flutter/material.dart';

class AddBookViewModel {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final TextEditingController categoryController = TextEditingController();
  late String name, price, desc, category, poster;
  late int authorId;
  final String titlePage = 'Add Book';

  List<String> categories = [
    'Undefined',
    // 'Classics',
    'Adventure',
    'Biography',
    // 'Short Stories',
    'Dystopia',
    // 'Fantasy',
    'Fantastic',
    'Horror',
    'Science',
    'ScienceFiction',
    // 'Romance',
    // 'Cookbooks',
    // 'History',
    // 'Detective and Mystery',
    // 'Literary Fiction',
    // 'Comic ',
    // 'Action',
    'Poetry'
  ];

  void onSubmitClicked() {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      BooksAPI()
        ..addBook(Book(
            name: name,
            poster: poster,
            category: category,
            price: price,
            authorId: authorId,
            background: desc));
    }
  }
}
