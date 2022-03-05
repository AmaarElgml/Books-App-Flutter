import 'package:books_store_app/style/app_theme.dart';
import 'package:books_store_app/utils/consts.dart';
import 'package:books_store_app/views/user/search/search_view_model.dart';
import 'package:books_store_app/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final SearchViewModel viewModel = SearchViewModel();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(viewModel.pageTitle)),
        body: Column(children: [
          Container(
              height: 80.0,
              child: Stack(children: <Widget>[
                Container(
                    color: primaryColor,
                    width: MediaQuery.of(context).size.width,
                    height: defSpacing * 1.25),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: defSpacing),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(defSpacing / 4),
                            border: Border.all(
                              color: primaryColor.withOpacity(0.5),
                              width: 1.0,
                            ),
                            color: Colors.white),
                        child: Row(children: [
                          Expanded(
                              child: TextField(
                                  controller: controller,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.all(defSpacing / 2),
                                      border: InputBorder.none,
                                      hintText: "Titles, authors, or topics"))),
                          CustomIconButton(
                              icon: Icons.search,
                              onPressed: () {
                                viewModel.search(controller.text);
                              })
                        ])))
              ])),
          controller.text.isEmpty
              ? Center(
                  child: Text(viewModel.warningString,
                      style: TextStyle(color: Colors.grey)))
              : SizedBox()
        ]));
  }
}
