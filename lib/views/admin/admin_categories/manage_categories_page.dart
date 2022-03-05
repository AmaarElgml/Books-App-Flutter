import 'package:books_store_app/style/app_theme.dart';
import 'package:books_store_app/utils/consts.dart';
import 'package:books_store_app/views/admin/admin_categories/cubit/cubit.dart';
import 'package:books_store_app/views/admin/admin_categories/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageCategoriesPage extends StatelessWidget {
  final TextEditingController _addCategoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AdminCategoriesCubit(),
        child: BlocConsumer<AdminCategoriesCubit, AdminCategoriesStates>(
            listener: (context, state) {
          final AdminCategoriesCubit cubit = AdminCategoriesCubit.get(context);
          if (state is AdminCategoriesAddCategoryState) {
            _addCategoryController.clear();
            Navigator.pop(context);
            showSnackBar(
                context: context,
                text: '\'${_addCategoryController.text}\' added successfully',
                state: ToastStates.SUCCESS);
          }
          if (state is AdminCategoriesAddPressedState)
            textInputDialog(
                title: 'Add new category',
                inputHint: 'Category name',
                addPressed: () {
                  cubit.addCategory(_addCategoryController.text);
                },
                context: context,
                controller: _addCategoryController);
        }, builder: (context, state) {
          final AdminCategoriesCubit cubit = AdminCategoriesCubit.get(context);
          return Scaffold(
              backgroundColor: primaryColor,
              appBar: AppBar(title: Text(cubit.pageTitle), actions: [
                IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      cubit.onAddCategoryPressed();
                    })
              ]),
              body: ListView(children: [
                ...cubit.categories.map((category) => ListTile(
                    title:
                        Text(category, style: TextStyle(color: Colors.white)),
                    leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text(category.substring(0, 1),
                            style: TextStyle(color: primaryColor)),
                        radius: 15)))
              ]));
        }));
  }
}
