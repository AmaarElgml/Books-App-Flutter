import 'package:books_store_app/utils/consts.dart';
import 'package:books_store_app/views/user/my_books/cubit/cubit.dart';
import 'package:books_store_app/views/user/my_books/cubit/states.dart';
import 'package:books_store_app/widgets/books_list_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../latest_news/latest_news_page.dart';

class MyBooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyBooksCubit, MyBooksStates>(
        listener: (context, state) {
      if (state is MyBooksGoToLatestNewsState) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LatestNewsPage()));
      }
    }, builder: (context, state) {
      MyBooksCubit cubit = MyBooksCubit.get(context);
      return DefaultTabController(
          length: cubit.titles.length,
          child: Builder(builder: (BuildContext context) {
            DefaultTabController.of(context)!.animateTo(cubit.listNum);
            return Scaffold(
                appBar: AppBar(
                    title: Text(cubit.pageTitle),
                    actions: [
                      IconButton(
                          icon: Icon(FontAwesomeIcons.solidNewspaper),
                          onPressed: () {
                            cubit.goToLatestNewsPage();
                          })
                    ],
                    bottom: TabBar(
                        isScrollable: true,
                        onTap: (index) {
                          cubit.onTabBarTapped(index);
                        },
                        tabs: [
                          ...cubit.titles.map((element) {
                            return CustomTap(
                                item: element,
                                index: cubit.titles.indexOf(element),
                                tapNum: cubit.listNum);
                          })
                        ])),
                body: TabBarView(physics: BouncingScrollPhysics(), children: [
                  ...cubit.titles.map((tap) {
                    return BooksListGenerator(
                        cubit.whichListTapped(cubit.titles.indexOf(tap)));
                  })
                ]));
          }));
    });
  }
}

class CustomTap extends StatelessWidget {
  CustomTap({required this.item, required this.index, required this.tapNum});

  final String item;
  final int index;
  final int tapNum;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(item),
      Padding(
          padding: EdgeInsets.all(defSpacing / 4),
          child: CircleAvatar(
              radius: 10,
              child: Text(booksTabsNotify[index].toString(),
                  style: TextStyle(fontSize: 12)),
              backgroundColor:
                  (tapNum == index) ? Colors.white : Colors.white54))
    ]);
  }
}
