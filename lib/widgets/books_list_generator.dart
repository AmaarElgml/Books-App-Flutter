import 'package:books_store_app/repositories/books/books_api.dart';
import 'package:books_store_app/style/app_theme.dart';
import 'package:books_store_app/utils/consts.dart';
import 'package:books_store_app/shared_view_models/book_view_model.dart';
import 'package:books_store_app/views/user/home/home_view_model.dart';
import 'package:books_store_app/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//ignore: must_be_immutable
class BooksListGenerator extends StatelessWidget {
  BooksListGenerator(this.books);

  final List<BookViewModel> books;

  final homeViewModel = HomeViewModel(booksRepository: BooksAPI());

  bool isRead = false, isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return books.length > 0
        ? ListView(physics: BouncingScrollPhysics(), children: [
            ...books
                .map((book) => GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context) => BookDetailsPage(book: book)));
                    },
                    child: ListTile(
                        onTap: () {},
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(defSpacing / 4),
                          child: Image.network(book.poster,
                              height: defSpacing * 10, fit: BoxFit.cover),
                        ),
                        title: Text(book.name, style: kBookNameStyle),
                        // subtitle: Text('by: ${book.author}',
                        //     style: Theme.of(context)
                        //         .textTheme
                        //         .caption!
                        //         .copyWith(fontSize: 14)),
                        selected: true,
                        trailing:
                            Row(mainAxisSize: MainAxisSize.min, children: [
                          IconButton(
                              icon: isRead
                                  ? Icon(FontAwesomeIcons.checkSquare)
                                  : Icon(FontAwesomeIcons.square),
                              onPressed: () {
                                // setState(() {
                                //   isRead = !isRead;
                                // });
                              }),
                          IconButton(
                              icon: isFavourite
                                  ? Icon(FontAwesomeIcons.solidHeart)
                                  : Icon(FontAwesomeIcons.heart),
                              onPressed: () {
                                // setState(() {
                                //   isFavourite = !isFavourite;
                                // });
                              })
                        ]))))
                .toList()
          ])
        : CustomCircularProgress(primaryColor);
  }
}
