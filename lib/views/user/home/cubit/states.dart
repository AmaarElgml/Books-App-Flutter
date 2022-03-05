abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeGetBooksLoadingState extends HomeStates {}

class HomeGetBooksSuccessState extends HomeStates {}

class HomeGetBooksErrorState extends HomeStates {
  final String error;

  HomeGetBooksErrorState(this.error);
}

class HomeGetAuthorsLoadingState extends HomeStates {}

class HomeGetAuthorsSuccessState extends HomeStates {}

class HomeGetAuthorsErrorState extends HomeStates {
  final String error;

  HomeGetAuthorsErrorState(this.error);
}

class HomeAddBookPressedState extends HomeStates {}

class HomeSearchBookPressedState extends HomeStates {}

class HomeAddAuthorPressedState extends HomeStates {}

class HomeCheckTrendingAuthorsState extends HomeStates {}