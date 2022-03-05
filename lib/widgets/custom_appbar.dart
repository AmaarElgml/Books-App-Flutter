import 'package:books_store_app/style/app_theme.dart';
import 'package:books_store_app/utils/consts.dart';
import 'package:books_store_app/views/user/latest_news/latest_news_page.dart';
import 'package:books_store_app/views/user/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_widgets.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({
    required this.onMenuPressed,
  }) : preferredSize = Size.fromHeight(100.0);

  @override
  final Size preferredSize;

  final Function onMenuPressed;

  @override
  State<StatefulWidget> createState() => new _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100.0,
        child: Stack(children: <Widget>[
          Container(
              color: primaryColor,
              width: MediaQuery.of(context).size.width,
              height: 60.0),
          Positioned(
              top: 40.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: defSpacing),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: primaryColor.withOpacity(0.5),
                            width: 1.0,
                          ),
                          color: Colors.white),
                      child: Row(children: [
                        CustomIconButton(
                            icon: Icons.menu,
                            onPressed: () {
                              widget.onMenuPressed();
                            }),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            navigateTo(context, SearchPage());
                          },
                          child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Titles, authors, or topics")),
                        )),
                        CustomIconButton(
                            icon: Icons.search,
                            onPressed: () {
                              navigateTo(context, SearchPage());
                            }),
                        CustomIconButton(
                            icon: FontAwesomeIcons.solidNewspaper,
                            onPressed: () {
                              navigateTo(context, LatestNewsPage());
                            })
                      ]))))
        ]));
  }
}
