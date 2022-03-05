import 'package:books_store_app/style/app_theme.dart';
import 'package:books_store_app/views/admin/admin_home/admin_home_page.dart';
import 'package:books_store_app/views/user/home/cubit/cubit.dart';
import 'package:books_store_app/views/user/latest_news/cubit/cubit.dart';
import 'package:books_store_app/views/user/my_books/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (context) => HomeCubit()
            ..getBooks()
            ..getAuthors()),
      BlocProvider(
          create: (context) => MyBooksCubit()
            ..getCurrentlyReadingBooks()
            ..getWantsToReadBooks()
            ..getReadBooks()
            ..getFavouritesBooks()),
      BlocProvider(create: (context) => LatestNewsCubit()..getLatestNews())
    ], child: MaterialApp(debugShowCheckedModeBanner: false, home: AdminHomePage(), theme: appTheme));
  }
}
