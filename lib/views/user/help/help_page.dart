import 'package:books_store_app/utils/consts.dart';
import 'package:books_store_app/views/user/help/help_view_model.dart';
import 'package:books_store_app/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  final HelpViewModel viewModel = HelpViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(viewModel.pageTitle)),
        body: Padding(
            padding: EdgeInsets.all(defSpacing),
            child: ListView(children: [
              Text(viewModel.whatToDoInAppString),
              SizedBox(height: defSpacing),
              CustomTextField(
                  hint: 'Type a question, or hint to the support',
                  iconData: Icons.title,
                  onSaved: () {}),
              SizedBox(height: defSpacing*.75),
              CustomButton(
                  title: 'Send',
                  onPressed: () {
                    viewModel.sendQuestionToSupport();
                  }),
              SizedBox(height: defSpacing),
              Text(viewModel.appDescription)
            ])));
  }
}
