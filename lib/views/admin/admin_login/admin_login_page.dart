import 'package:books_store_app/style/app_theme.dart';
import 'package:books_store_app/utils/consts.dart';
import 'package:books_store_app/views/admin/admin_home/admin_home_page.dart';
import 'package:books_store_app/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

//ignore: must_be_immutable
class AdminLoginPage extends StatelessWidget {
  String? _email, _password;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => AdminLoginCubit(),
      child: BlocConsumer<AdminLoginCubit, AdminLoginStates>(
        listener: (context, state) {
          if (state is AdminLoginButtonPressedState)
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => AdminHomePage()),
                (Route<dynamic> route) => false);
        },
        builder: (context, state) {
          AdminLoginCubit cubit = AdminLoginCubit.get(context);
          return Scaffold(
              backgroundColor: primaryColor,
              body: ProgressHUD(
                  child: Form(
                      key: cubit.globalKey,
                      child: Padding(
                          padding: EdgeInsets.only(
                              right: defSpacing * 2,
                              left: defSpacing * 2,
                              top: height * .06),
                          child: ListView(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: height * .08),
                                Text('Hello!',
                                    style: kSignTitleStyle.copyWith(
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: defSpacing / 4),
                                Text('Welcome', style: kSignTitleStyle),
                                SizedBox(height: defSpacing / 4),
                                Text('back', style: kSignTitleStyle),
                              ],
                            ),
                            SizedBox(height: height * .1),
                            CustomTextField(
                              borders: kSecSignInputBorder,
                              hint: 'Email',
                              iconData: Icons.email,
                              onSaved: (value) {
                                _email = value;
                              },
                            ),
                            SizedBox(height: height * .02),
                            CustomTextField(
                              borders: kSecSignInputBorder,
                              hint: 'Password',
                              iconData: Icons.lock,
                              onSaved: (value) {
                                _password = value;
                              },
                            ),
                            SizedBox(height: height * .05),
                            CustomButton(
                                title: 'Login',
                                backColor: Colors.white,
                                titleColor: primaryColor,
                                onPressed: () {
                                  cubit.onLoginClicked(_email, _password);
                                }),
                            SizedBox(height: height * .2),
                            TextButton(
                                onPressed: () {},
                                child: Text('Contact with support',
                                    style: kWhiteCaption))
                          ])))));
        },
      ),
    );
  }
}
