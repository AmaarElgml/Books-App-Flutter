import 'package:books_store_app/utils/consts.dart';
import 'package:books_store_app/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'add_news_view_model.dart';

// ignore: must_be_immutable
class AddNewsPage extends StatelessWidget {
  final AddNewsViewModel viewModel = AddNewsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(viewModel.titlePage),
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                })),
        body: Form(
            key: viewModel.globalKey,
            child: Padding(
                padding: EdgeInsets.all(defSpacing * 1.5),
                child: ListView(children: [
                  CustomTextField(
                      hint: 'Title',
                      iconData: Icons.drive_file_rename_outline,
                      onSaved: (value) {
                        viewModel.title = value;
                      }),
                  SizedBox(height: defSpacing * .75),
                  CustomTextField(
                      hint: 'Body',
                      iconData: Icons.text_fields,
                      onSaved: (value) {
                        viewModel.body = value;
                      }),
                  SizedBox(height: defSpacing * .75),
                  CustomTextField(
                      hint: 'Date',
                      iconData: Icons.date_range,
                      onSaved: (value) {
                        viewModel.date = value;
                      }),
                  SizedBox(height: defSpacing * .75),
                  CustomSearchTextField(
                      icon: Icons.category_rounded,
                      list: viewModel.types,
                      hint: "Type",
                      controller: viewModel.typeController,
                      onTap: (item) {
                        viewModel.type = item;
                      }),
                  SizedBox(height: defSpacing * 1.5),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              viewModel.onSubmitClicked();
                            },
                            child: Text(
                              'Submit',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(defSpacing * .75)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            defSpacing * .75)))))
                      ])
                ]))));
  }
}
