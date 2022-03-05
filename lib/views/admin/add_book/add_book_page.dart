import 'package:books_store_app/style/app_theme.dart';
import 'package:books_store_app/utils/consts.dart';
import 'package:books_store_app/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'add_book_view_model.dart';

//ignore: must_be_immutable
class AddBookPage extends StatelessWidget {
  final AddBookViewModel viewModel = AddBookViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
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
                      borders: kSecSignInputBorder,
                      hint: 'Book name',
                      iconData: Icons.drive_file_rename_outline,
                      onSaved: (value) {
                        viewModel.name = value;
                      }),
                  SizedBox(height: defSpacing * .75),
                  CustomTextField(
                      hint: 'Book author',
                      borders: kSecSignInputBorder,
                      iconData: Icons.person_outline,
                      onSaved: (value) {
                        viewModel.authorId = int.parse(value.toString());
                      }),
                  SizedBox(height: defSpacing * .75),
                  CustomTextField(
                      hint: 'Book description',
                      borders: kSecSignInputBorder,
                      iconData: Icons.description_outlined,
                      onSaved: (value) {
                        viewModel.desc = value;
                      }),
                  SizedBox(height: defSpacing * .75),
                  CustomSearchTextField(
                      icon: Icons.category_outlined,
                      list: viewModel.categories,
                      hint: 'Book category',
                      controller: viewModel.categoryController,
                      onTap: (item) {
                        viewModel.category = item;
                      }),
                  SizedBox(height: defSpacing * .75),
                  CustomTextField(
                      hint: 'Book price',
                      borders: kSecSignInputBorder,
                      iconData: Icons.monetization_on_outlined,
                      onSaved: (value) {
                        viewModel.price = value;
                      }),
                  SizedBox(height: defSpacing * .75),
                  CustomTextField(
                      hint: 'Book poster',
                      borders: kSecSignInputBorder,
                      iconData: Icons.image_outlined,
                      onSaved: (value) {
                        viewModel.poster = value;
                      }),
                  SizedBox(height: defSpacing * 1.5),
                  CustomButton(
                      title: 'Submit',
                      backColor: Colors.white,
                      titleColor: primaryColor,
                      onPressed: () {
                        viewModel.onSubmitClicked();
                      })
                ]))));
  }
}
