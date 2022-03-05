import 'package:books_store_app/views/admin/admin_news/manage_news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../admin_account/admin_account_page.dart';
import '../../admin_roles/admins_roles_page.dart';
import '../../admin_analysis/admin_analysis_page.dart';
import '../../admin_authors/manage_authors_page.dart';
import '../../admin_books/manage_books_page.dart';
import '../../admin_categories/manage_categories_page.dart';
import 'states.dart';

class AdminHomeCubit extends Cubit<AdminHomeStates> {
  AdminHomeCubit() : super(AdminHomeInitialState());

  static AdminHomeCubit get(context) => BlocProvider.of(context);
  final String pageTitle = 'Admin Panel';

  final List<String> adminOptions = [
    'Manage Books',
    'Manage Categories',
    'Manage Authors',
    'Manage News',
    'Analysis',
    'Admins Roles',
    'Settings',
  ];
  final List<IconData> adminOptionsIcons = [
    Icons.library_books,
    Icons.category_rounded,
    Icons.person_search,
    Icons.library_books,
    Icons.analytics,
    Icons.build,
    Icons.account_circle,
  ];
  final List<Widget> adminOptionsRoutes = [
    ManageBooksPage(),
    ManageCategoriesPage(),
    ManageAuthorsPage(),
    ManageNewsPage(),
    AdminAnalysisPage(),
    AdminRolesScreen(),
    AdminAccountPage(),
  ];

  void openAdminOption(int index) {
    emit(AdminHomeOpenAdminOptionState(index));
  }

  void onLogOutPressed() {
    emit(AdminHomeLogOutPressedState());
  }

  void logOut() {
    emit(AdminHomeLogOutState());
  }

}
