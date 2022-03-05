import 'package:books_store_app/style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:books_store_app/utils/consts.dart';
import 'package:books_store_app/widgets/custom_widgets.dart';
import 'add_author_view_model.dart';

//ignore: must_be_immutable
class AddAuthorPage extends StatelessWidget {
  final AddAuthorViewModel viewModel = AddAuthorViewModel();

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
                      hint: 'Author name',
                      iconData: Icons.drive_file_rename_outline,
                      onSaved: (value) {
                        viewModel.name = value;
                      }),
                  SizedBox(height: defSpacing * .75),
                  CustomTextField(
                      borders: kSecSignInputBorder,
                      hint: 'No. Books',
                      iconData: Icons.person_outline,
                      onSaved: (value) {
                        viewModel.booksNo = value;
                      }),
                  SizedBox(height: defSpacing * .75),
                  CustomTextField(
                      borders: kSecSignInputBorder,
                      hint: 'Author Image',
                      iconData: Icons.image_outlined,
                      onSaved: (value) {
                        viewModel.image = value;
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
