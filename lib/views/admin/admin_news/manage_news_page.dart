import 'package:books_store_app/style/app_theme.dart';
import 'package:books_store_app/shared_view_models/news_view_model.dart';
import 'package:books_store_app/views/admin/add_news/add_news_page.dart';
import 'package:books_store_app/views/user/latest_news/cubit/cubit.dart';
import 'package:books_store_app/views/user/latest_news/cubit/states.dart';
import 'package:books_store_app/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageNewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LatestNewsCubit, LatestNewsStates>(
        listener: (context, state) {
      if (state is LatestNewsAddNewsPressedState)
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AddNewsPage()));
    }, builder: (context, state) {
      final LatestNewsCubit cubit = LatestNewsCubit.get(context);
      final List<NewsViewModel> news = cubit.latestNews;
      return Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(title: Text(cubit.managePageTitle), actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  cubit.onAddNewsPressed();
                })
          ]),
          body: news.length > 0
              ? ListView(children: [
                  ...news.map((news) => ListTile(
                      isThreeLine: true,
                      leading: Icon(cubit.getAppropriateIcon(news.type),
                          color: Colors.white),
                      title: Text(news.title,
                          style: TextStyle(color: Colors.white)),
                      subtitle: Text(news.body,
                          style: TextStyle(color: Colors.white60),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify),
                      trailing: Text(news.date.split('20').first,
                          style: TextStyle(color: Colors.white))))
                ])
              : CustomCircularProgress(Colors.white));
    });
  }
}
