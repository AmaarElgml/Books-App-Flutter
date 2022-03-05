abstract class AdminCategoriesStates {}

class AdminCategoriesInitialState extends AdminCategoriesStates {}

class AdminCategoriesAddPressedState extends AdminCategoriesStates {}

class AdminCategoriesAddCategoryState extends AdminCategoriesStates {
  final String category;

  AdminCategoriesAddCategoryState(this.category);
}
