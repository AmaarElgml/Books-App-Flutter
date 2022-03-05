import 'package:books_store_app/views/user/settings/settings_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  final SettingsViewModel viewModel = SettingsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(viewModel.titlePage), actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ]),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          ListTile(
              onTap: () {
                viewModel.changeLanguage();
              },
              title: Text('Language'),
              leading: Icon(Icons.language)),
          ListTile(
              onTap: () {
                viewModel.rateApp();
              },
              title: Text('Rate App'),
              leading: Icon(CupertinoIcons.heart)),
          ListTile(
              title: Text('Version'),
              leading: Icon(Icons.verified_outlined))
        ]));
  }
}
