import 'package:books_store_app/models/author.dart';
import 'package:books_store_app/repositories/authors/authors_api.dart';
import 'package:flutter/material.dart';

class AddAuthorViewModel {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final String titlePage = 'Add Author';
  late String name, image, booksNo;

  void onSubmitClicked() {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      AuthorsAPI()
        ..addAuthor(Author(name: name, image: image, booksNum: booksNo));
    }
  }
}
