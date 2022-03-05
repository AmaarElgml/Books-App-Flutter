import 'package:books_store_app/utils/consts.dart';
import 'package:books_store_app/shared_view_models/author_view_model.dart';
import 'package:flutter/material.dart';
import 'custom_widgets.dart';

class TopAuthors extends StatelessWidget {
  TopAuthors({required this.authors});

  final List<AuthorViewModel> authors;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TitleText(title: 'Top Authors'),
      SizedBox(height: defSpacing / 2),
      Container(
          height: defSpacing * 4.5,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              primary: false,
              itemCount: authors.length,
              itemBuilder: (BuildContext context, int index) {
                String img = authors[index].image == 'null'
                    ? userDefaultAvatar
                    : authors[index].image;
                return Padding(
                    padding: EdgeInsets.only(left: defSpacing * 0.75),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(img),
                      radius: defSpacing * 2,
                    ));
              }))
    ]);
  }
}
