import 'package:books_store_app/repositories/fake_data.dart';
import 'package:books_store_app/style/app_theme.dart';
import 'package:books_store_app/utils/consts.dart';
import 'package:flutter/material.dart';
import 'custom_widgets.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TitleText(title: 'Categories'),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: defSpacing / 2),
          child: Wrap(children: [
            ...categories.map((element) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: Chip(
                      backgroundColor: primaryColor.withOpacity(.06),
                      elevation: 2,
                      avatar:
                          CircleAvatar(child: Text(element.substring(0, 1))),
                      label: Text(element)));
            })
          ]))
    ]);
  }
}
