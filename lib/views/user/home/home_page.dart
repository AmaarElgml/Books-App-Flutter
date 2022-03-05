import 'package:books_store_app/style/app_theme.dart';
import 'package:books_store_app/utils/consts.dart';
import 'package:books_store_app/shared_view_models/author_view_model.dart';
import 'package:books_store_app/shared_view_models/book_view_model.dart';
import 'package:books_store_app/views/user/home/cubit/cubit.dart';
import 'package:books_store_app/views/user/home/cubit/states.dart';
import 'package:books_store_app/widgets/categories.dart';
import 'package:books_store_app/widgets/custom_appbar.dart';
import 'package:books_store_app/widgets/custom_widgets.dart';
import 'package:books_store_app/widgets/side_menu.dart';
import 'package:books_store_app/widgets/top_authors.dart';
import 'package:books_store_app/widgets/trending_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          List<BookViewModel>? trendingBooks = cubit.trendingBooks;
          List<AuthorViewModel>? topAuthors = cubit.topAuthors;
          return Scaffold(
              key: cubit.scaffoldKey,
              appBar: CustomAppBar(onMenuPressed: () {
                cubit.scaffoldKey.currentState!.openDrawer();
              }),
              drawer: SideMenu(),
              body: trendingBooks.length > 0 && topAuthors.length > 0
                  ? ListView(children: [
                      Categories(),
                      SizedBox(height: defSpacing / 2),
                      TrendingBooks(books: trendingBooks),
                      SizedBox(height: defSpacing / 2),
                      TopAuthors(authors: topAuthors),
                      SizedBox(height: defSpacing)
                    ])
                  : CustomCircularProgress(primaryColor));
        });
  }
}
