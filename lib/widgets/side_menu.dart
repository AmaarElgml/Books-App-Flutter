import 'package:books_store_app/style/app_theme.dart';
import 'package:books_store_app/utils/consts.dart';
import 'package:books_store_app/views/admin/admin_login/admin_login_page.dart';
import 'package:books_store_app/views/user/help/help_page.dart';
import 'package:books_store_app/views/user/latest_news/latest_news_page.dart';
import 'package:books_store_app/views/user/my_books/cubit/cubit.dart';
import 'package:books_store_app/views/user/my_books/cubit/states.dart';
import 'package:books_store_app/views/user/my_books/my_books_page.dart';
import 'package:books_store_app/views/user/search/search_page.dart';
import 'package:books_store_app/views/user/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyBooksCubit, MyBooksStates>(
        listener: (context, state) {},
        builder: (context, state) {
          MyBooksCubit cubit = MyBooksCubit.get(context);
          return Drawer(
              child: ListView(children: [
            DrawerHeader(
                child: SvgPicture.asset("assets/icons/logo.svg",
                    color: primaryColor)),
            ExpansionTile(
                title: Text("My books"),
                leading: Icon(FontAwesomeIcons.book),
                childrenPadding: EdgeInsets.symmetric(horizontal: defSpacing),
                children: [
                  DrawerListTile(
                      title: "Currently Reading",
                      icon: FontAwesomeIcons.bookOpen,
                      hasTrailing: booksTabsNotify[0],
                      press: () {
                        cubit.setTapNum(0);
                        navigateTo(context, MyBooksPage());
                      }),
                  DrawerListTile(
                      title: "Wants to Read",
                      icon: FontAwesomeIcons.listUl,
                      hasTrailing: booksTabsNotify[1],
                      press: () {
                        cubit.setTapNum(1);
                        navigateTo(context, MyBooksPage());
                      }),
                  DrawerListTile(
                      title: "Read",
                      icon: FontAwesomeIcons.solidCheckCircle,
                      hasTrailing: booksTabsNotify[2],
                      press: () {
                        cubit.setTapNum(2);
                        navigateTo(context, MyBooksPage());
                      }),
                  DrawerListTile(
                      title: "Favourites",
                      icon: FontAwesomeIcons.solidHeart,
                      hasTrailing: booksTabsNotify[3],
                      press: () {
                        cubit.setTapNum(3);
                        navigateTo(context, MyBooksPage());
                      })
                ]),
            DrawerListTile(
                title: "Search",
                icon: FontAwesomeIcons.search,
                press: () {
                  navigateTo(context, SearchPage());
                }),
            DrawerListTile(
                title: "Latest News",
                icon: FontAwesomeIcons.solidNewspaper,
                press: () {
                  navigateTo(context, LatestNewsPage());
                }),
            DrawerListTile(
                title: "Help",
                icon: FontAwesomeIcons.solidQuestionCircle,
                press: () {
                  navigateTo(context, HelpPage());
                }),
            DrawerListTile(
                title: "Settings",
                icon: FontAwesomeIcons.cog,
                press: () {
                  navigateTo(context, SettingPage());
                }),
            DrawerListTile(
                title: "Admin Panel",
                icon: FontAwesomeIcons.lock,
                press: () {
                  navigateTo(context, AdminLoginPage());
                })
          ]));
        });
  }
}

class DrawerListTile extends StatelessWidget {
  DrawerListTile({
    required this.title,
    required this.icon,
    required this.press,
    this.hasTrailing,
  });

  final String title;
  final IconData icon;
  final VoidCallback press;
  final int? hasTrailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: FaIcon(icon),
        title: Text(title),
        trailing:
            hasTrailing != null ? Text(hasTrailing.toString()) : SizedBox());
  }
}
