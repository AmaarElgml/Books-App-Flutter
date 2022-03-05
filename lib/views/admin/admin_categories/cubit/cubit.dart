import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';

class AdminCategoriesCubit extends Cubit<AdminCategoriesStates> {
  AdminCategoriesCubit() : super(AdminCategoriesInitialState());

  static AdminCategoriesCubit get(context) => BlocProvider.of(context);
  final String pageTitle = 'Manage Categories';

  List<String> categories = [
    'Classics',
    'Adventure',
    'Biography',
    'Short Stories',
    'Dystopia',
    'Fantasy',
    'Horror',
    'Science',
    'ScienceFiction',
    'Romance',
    'Cookbooks',
    'History',
    'Detective and Mystery',
    'Literary Fiction',
    'Comic ',
    'Action',
    'Poetry',
  ];

  void onAddCategoryPressed() {
    emit(AdminCategoriesAddPressedState());
  }

  void addCategory(String category) {
    emit(AdminCategoriesAddCategoryState(category));
  }
}
