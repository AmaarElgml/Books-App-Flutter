import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:books_store_app/views/user/home/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_store_app/views/admin/admin_home/cubit/cubit.dart';
import 'package:books_store_app/views/admin/admin_home/cubit/states.dart';
import 'package:books_store_app/style/app_theme.dart';
import 'package:books_store_app/utils/consts.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AdminHomeCubit(),
        child: BlocConsumer<AdminHomeCubit, AdminHomeStates>(
          listener: (context, state) {
            AdminHomeCubit cubit = AdminHomeCubit.get(context);
            if (state is AdminHomeLogOutPressedState)
              showAlertDialog(
                  context: context,
                  btnText: 'Switch to users side',
                  btnPressed: () {
                    cubit.logOut();
                  });

            if (state is AdminHomeOpenAdminOptionState)
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      cubit.adminOptionsRoutes[state.whichOption]));
            if (state is AdminHomeLogOutState)
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (Route<dynamic> route) => false);
          },
          builder: (context, state) {
            AdminHomeCubit cubit = AdminHomeCubit.get(context);
            return Scaffold(
                appBar: AppBar(title: Text(cubit.pageTitle), actions: [
                  IconButton(icon: Icon(CupertinoIcons.bell), onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.logout),
                      onPressed: () {
                        cubit.onLogOutPressed();
                      })
                ]),
                body: Container(
                    color: primaryColor,
                    padding: EdgeInsets.all(defSpacing),
                    child: GridView.count(
                        crossAxisSpacing: defSpacing,
                        mainAxisSpacing: defSpacing,
                        crossAxisCount: 2,
                        childAspectRatio: .9,
                        children:
                            List.generate(cubit.adminOptions.length, (index) {
                          return AdminOptionCard(
                              optionName: cubit.adminOptions[index],
                              optionIcon: cubit.adminOptionsIcons[index],
                              optionPressed: () {
                                cubit.openAdminOption(index);
                              });
                        }))));
          },
        ));
  }
}

class AdminOptionCard extends StatelessWidget {
  AdminOptionCard(
      {required this.optionName,
      required this.optionIcon,
      required this.optionPressed});

  final String optionName;
  final IconData optionIcon;
  final Function optionPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          optionPressed();
        },
        child: Card(
            elevation: defSpacing / 4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defSpacing * .75)),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(optionIcon, size: 36, color: primaryColor),
                  SizedBox(height: defSpacing / 2),
                  Text(optionName,
                      style: TextStyle(fontSize: 16, color: primaryColor))
                ])));
  }
}
