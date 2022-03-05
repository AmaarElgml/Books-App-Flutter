import 'package:books_store_app/repositories/fake_data.dart';
import 'package:books_store_app/style/app_theme.dart';
import 'package:books_store_app/utils/consts.dart';
import 'package:flutter/material.dart';
import 'admin_roles_view_model.dart';

class AdminRolesScreen extends StatelessWidget {
  final AdminRolesViewModel viewModel = AdminRolesViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(viewModel.pageTitle)),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            child: Icon(Icons.add, color: primaryColor),
            onPressed: () {
              viewModel.addAdmin();
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Container(
            color: primaryColor,
            padding: EdgeInsets.symmetric(
                horizontal: defSpacing, vertical: defSpacing / 2),
            child: ListView.builder(
              itemBuilder: (context, index) => AdminRoleCard(
                  email: admins[index].email,
                  role: admins[index].getRole,
                  image: admins[index].image,
                  isOnline: admins[index].online),
              itemCount: admins.length,
            )));
  }
}

class AdminRoleCard extends StatelessWidget {
  AdminRoleCard(
      {required this.email,
      required this.role,
      required this.isOnline,
      required this.image});

  final String email;
  final String role;
  final bool isOnline;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Card(
            margin: EdgeInsets.only(bottom: defSpacing / 2),
            elevation: 4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defSpacing * .75)),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: ListTile(
                title: Text(role),
                subtitle: Text(email),
                trailing: CircleAvatar(
                    backgroundColor: isOnline ? Colors.green : Colors.grey,
                    radius: 6),
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        image == 'null' ? userDefaultAvatar : image),
                    radius: 25))));
  }
}
