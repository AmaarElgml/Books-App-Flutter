import 'package:books_store_app/shared_view_models/book_view_model.dart';
import 'package:books_store_app/views/user/book_details/book_details_page.dart';
import 'package:flutter/material.dart';
import 'book_card.dart';
import 'custom_widgets.dart';

class TrendingBooks extends StatelessWidget {
  final List<BookViewModel> books;

  TrendingBooks({required this.books});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TitleText(title: 'Trending Books'),
      Row(children: [
        Expanded(
            child: SizedBox(
                height: 240.0,
                child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...books
                          .map((book) => GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        BookDetailsPage(book: book)));
                              },
                              child: BookCard(
                                  name: book.name, poster: book.poster)))
                          .toList()
                    ])))
      ])
    ]);
  }
}
