import 'package:books_store_app/repositories/fake_data.dart';
import 'package:books_store_app/style/app_theme.dart';
import 'package:books_store_app/utils/consts.dart';
import 'package:books_store_app/shared_view_models/author_view_model.dart';
import 'package:books_store_app/views/user/home/cubit/cubit.dart';
import 'package:books_store_app/views/user/home/cubit/states.dart';
import 'package:books_store_app/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../add_author/add_author_page.dart';

class ManageAuthorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) async {
      if (state is HomeCheckTrendingAuthorsState) {
        showLoaderDialog(context);
        await Future.delayed(Duration(seconds: 2), () {
          fakeAuthors.shuffle();
          Navigator.pop(context);
          showToast(text: 'Updated', state: ToastStates.SUCCESS);
        });
      }

      if (state is HomeAddAuthorPressedState)
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AddAuthorPage()));
    }, builder: (context, state) {
      final HomeCubit cubit = HomeCubit.get(context);
      final List<AuthorViewModel> authors = cubit.topAuthors;
      return Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(title: Text(cubit.pageAuthorTitle), actions: [
            IconButton(
                onPressed: () {
                  cubit.onAddAuthorPressed();
                },
                icon: Icon(Icons.add))
          ]),
          body: authors.length > 0
              ? ListView(children: [
                  ...authors
                      .map((author) => ListTile(
                          title: Text(author.name,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                          subtitle: Text('No. books: ${author.booksNum}',
                              style: kWhiteCaption),
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  author.image == 'null'
                                      ? userDefaultAvatar
                                      : author.image),
                              radius: 30.0)))
                      .toList(),
                  SizedBox(height: defSpacing * 2),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: defSpacing),
                      child: CustomButton(
                          title: 'Check Trending',
                          onPressed: () {
                            cubit.checkIfChangesInTopAuthors();
                          },
                          titleColor: primaryColor,
                          backColor: Colors.white)),
                  SizedBox(height: defSpacing / 2),
                  Text(cubit.explainingShuffling,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center),
                  SizedBox(height: defSpacing * 2)
                ])
              : CustomCircularProgress(Colors.white));
    });
  }
}
