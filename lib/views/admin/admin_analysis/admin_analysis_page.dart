import 'package:flutter/material.dart';
import 'package:books_store_app/repositories/fake_data.dart';
import 'package:books_store_app/utils/consts.dart';
import 'package:books_store_app/widgets/chart__custom_widgets.dart';
import 'package:books_store_app/widgets/custom_widgets.dart';
import 'package:books_store_app/style/app_theme.dart';
import 'admin_analysis_view_model.dart';

class AdminAnalysisPage extends StatelessWidget {
  final AdminsAnalysisViewModel viewModel = AdminsAnalysisViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(title: Text(viewModel.pageTitle)),
        body: Container(
            padding: EdgeInsets.all(defSpacing),
            child: ListView(children: [
              Chart(
                  mainItems: currentlyReading,
                  colors: viewModel.topBooksColors,
                  radius: viewModel.topBooksRadius,
                  title: 'Books'),
              ChartBullets(
                  listOfColors: viewModel.topBooksColors,
                  listOfTitle: currentlyReading),
              SizedBox(height: defSpacing),
              customDivider,
              SizedBox(height: defSpacing),
              Chart(
                  mainItems: fakeTopAuthors,
                  colors: viewModel.topAuthorsColors,
                  radius: viewModel.topAuthorsRadius,
                  title: 'Authors'),
              ChartBullets(
                  listOfColors: viewModel.topAuthorsColors,
                  listOfTitle: fakeTopAuthors)
            ])));
  }
}
