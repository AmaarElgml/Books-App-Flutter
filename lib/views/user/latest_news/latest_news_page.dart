import 'package:flutter/material.dart';
import 'package:books_store_app/shared_view_models/news_view_model.dart';
import 'package:books_store_app/views/user/latest_news/cubit/states.dart';
import 'package:books_store_app/widgets/custom_widgets.dart';
import 'package:books_store_app/style/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';

class LatestNewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LatestNewsCubit, LatestNewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          LatestNewsCubit cubit = LatestNewsCubit.get(context);
          List<NewsViewModel> latestNews = cubit.latestNews;
          return latestNews.length > 0
              ? Scaffold(
                  appBar: AppBar(title: Text(cubit.titlePage)),
                  body: ListView(children: [
                    ...latestNews.map((news) {
                      return ListTile(
                          tileColor: Colors.white,
                          isThreeLine: true,
                          leading: Icon(
                              cubit.getAppropriateIcon(
                                  news.type),
                              color: primaryColor),
                          title: Text(news.title),
                          subtitle: Text(news.body,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify),
                          trailing: Text(news.date.split('20').first,
                              style: TextStyle(color: primaryColor)));
                    }).toList()
                  ]))
              : CustomCircularProgress(primaryColor);
        });
  }
}
