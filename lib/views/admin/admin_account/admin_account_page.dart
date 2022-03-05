import 'package:flutter/material.dart';
import 'admin_account_view_model.dart';
import 'package:books_store_app/style/app_theme.dart';
import 'package:books_store_app/utils/consts.dart';

class AdminAccountPage extends StatelessWidget {
  final AdminAccountViewModel viewModel = AdminAccountViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(title: Text(viewModel.pageTitle)),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
              margin: EdgeInsets.only(top: defSpacing * 2),
              height: 90,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(viewModel.currentAdmin.image == 'null'
                          ? userDefaultAvatar
                          : viewModel.currentAdmin.image)))),
          SizedBox(
              height: defSpacing / 2, width: MediaQuery.of(context).size.width),
          TextButton.icon(
              icon: Text(viewModel.currentAdmin.name, style: kBigTextStyle),
              label: Icon(Icons.edit, size: 16, color: Colors.white),
              onPressed: () {}),
          Text(viewModel.currentAdmin.email, style: kWhiteCaption),
          SizedBox(height: defSpacing / 4),
          Text(viewModel.currentAdmin.getRole,
              style: kWhiteCaption.copyWith(
                  fontSize: 14, fontWeight: FontWeight.bold)),
          SizedBox(height: defSpacing * 2),
          ...List.generate(viewModel.settings.length, (index) {
            return ListTile(
                title: Text(viewModel.settings[index],
                    style: TextStyle(color: Colors.white)),
                leading:
                    Icon(viewModel.settingsIcon[index], color: Colors.white),
                onTap: () {});
          })
        ]));
  }
}
