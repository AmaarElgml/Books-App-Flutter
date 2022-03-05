import 'package:flutter/material.dart';
import 'package:books_store_app/style/app_theme.dart';
import 'package:books_store_app/utils/consts.dart';
import 'package:books_store_app/shared_view_models/book_view_model.dart';
import 'package:books_store_app/views/admin/add_book/add_book_page.dart';
import 'package:books_store_app/views/user/home/cubit/cubit.dart';
import 'package:books_store_app/views/user/home/cubit/states.dart';
import 'package:books_store_app/widgets/book_card.dart';
import 'package:books_store_app/widgets/custom_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageBooksPage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(listener: (context, state) {
      if (state is HomeAddBookPressedState)
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AddBookPage()));
    }, builder: (context, state) {
      HomeCubit cubit = HomeCubit.get(context);
      List<BookViewModel> books = cubit.trendingBooks;
      return Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(title: Text(cubit.pageTitle), actions: [
            IconButton(
                onPressed: () {
                  cubit.addBookPressed();
                },
                icon: Icon(Icons.add))
          ]),
          body: books.length > 0
              ? Padding(
                  padding: EdgeInsets.only(
                      right: defSpacing * .75, top: defSpacing * .75),
                  child: Column(children: [
                    SearchFieldRow(
                        controller: searchController,
                        onSearchPressed: () {
                          cubit.searchQuery(searchController.text.toString());
                        }),
                    SizedBox(height: defSpacing / 2),
                    Expanded(
                        child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: books.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.52,
                            ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    print(books[index].name);
                                  },
                                  child: BookCard(
                                    name: books[index].name,
                                    poster: books[index].poster,
                                    titleMaxLength: 10,
                                    backColor: primaryColor,
                                  ));
                            }))
                  ]))
              : CustomCircularProgress(Colors.white));
    });
  }
}

class SearchFieldRow extends StatelessWidget {
  const SearchFieldRow(
      {required this.controller, required this.onSearchPressed});

  final TextEditingController controller;
  final Function onSearchPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: defSpacing, right: defSpacing / 4),
        child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defSpacing * .75),
                border: Border.all(
                    color: Colors.blueAccent.withOpacity(0.5), width: 1.0),
                color: Colors.white),
            child: Row(children: [
              Expanded(
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: defSpacing * .75),
                      child: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Titles, authors, or topics")))),
              CustomIconButton(
                  icon: Icons.search,
                  onPressed: () {
                    onSearchPressed();
                  })
            ])));
  }
}
