import 'package:books_store_app/style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:books_store_app/repositories/fake_data.dart';
import 'package:books_store_app/utils/consts.dart';
import 'package:books_store_app/shared_view_models/book_view_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'book_details_view_model.dart';

class BookDetailsPage extends StatelessWidget {
  final BookDetailsViewModel viewModel = BookDetailsViewModel();
  BookDetailsPage({required this.book});

  final BookViewModel book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(left: defSpacing, right: defSpacing, top: defSpacing * 1.5),
            color: primaryColor,
            child: ListView(padding: EdgeInsets.all(0.0), children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: detailsFontColor),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Spacer(),
                    IconButton(
                        icon: Icon(FontAwesomeIcons.heart, color: detailsFontColor),
                        onPressed: () {
                          viewModel.addToFavourites(book);
                        })
                  ]),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(defSpacing / 2),
                      child: Image.network(book.poster,
                          height: 300.0, fit: BoxFit.fill)),
                  SizedBox(height: defSpacing * .75),
                  Text(book.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: detailsFontColor,
                          fontSize: 22)),
                  // SizedBox(height: defSpacing / 8),
                  // Text('by: ${book.author}',
                  //     style: TextStyle(color: detailsFontColor, fontSize: 16)),
                  SizedBox(height: defSpacing * .75),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextAndDesc(title: 'Rating', desc: '4.8'),
                        TextAndDesc(title: 'Pages', desc: '245'),
                        TextAndDesc(title: 'Language', desc: 'English')
                      ])
                ]),
                SizedBox(height: defSpacing),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                          onPressed: () {},
                          child: Text('Want to read',
                              style: TextStyle(color: detailsFontColor))),
                      OutlinedButton(
                          onPressed: () {},
                          child: Text('Currently reading',
                              style: TextStyle(color: detailsFontColor))),
                      OutlinedButton(
                          onPressed: () {},
                          child: Text('Read',
                              style: TextStyle(color: detailsFontColor)))
                    ])
              ]),
              SizedBox(height: defSpacing * 2),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                AboutBook(title: 'About the book', desc: book.background),
                AboutBook(
                    title: 'About the author',
                    desc: '$authorDesc')
              ]),
              SizedBox(height: defSpacing * 3)
            ])));
  }
}

class TextAndDesc extends StatelessWidget {
  TextAndDesc({required this.title, required this.desc});

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(title, style: TextStyle(color: detailsFontColor)),
      SizedBox(height: defSpacing / 4),
      Text(desc,
          style: TextStyle(
              color: detailsFontColor, fontWeight: FontWeight.bold, fontSize: 18))
    ]);
  }
}

class AboutBook extends StatelessWidget {
  AboutBook({required this.title, required this.desc});

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title,
          style: TextStyle(
              fontSize: 18, color: detailsFontColor, fontWeight: FontWeight.bold)),
      SizedBox(height: defSpacing / 4),
      Text(desc, style: TextStyle(fontSize: 14, color: detailsFontColor)),
      SizedBox(height: defSpacing)
    ]);
  }
}
