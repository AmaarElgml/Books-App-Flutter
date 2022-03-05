abstract class MyBooksStates {}

class MyBooksInitialState extends MyBooksStates {}

class MyBooksChangeTabState extends MyBooksStates {}

class MyBooksGetCurrentlyReadingBooksLoadingState extends MyBooksStates {}

class MyBooksGetCurrentlyReadingBooksSuccessState extends MyBooksStates {}

class MyBooksGetCurrentlyReadingBooksErrorState extends MyBooksStates {
  final String error;

  MyBooksGetCurrentlyReadingBooksErrorState(this.error);
}

class MyBooksGetWantsToReadLoadingState extends MyBooksStates {}

class MyBooksGetWantsToReadSuccessState extends MyBooksStates {}

class MyBooksGetWantsToReadErrorState extends MyBooksStates {
  final String error;

  MyBooksGetWantsToReadErrorState(this.error);
}

class MyBooksGetReadBooksLoadingState extends MyBooksStates {}

class MyBooksGetReadBooksSuccessState extends MyBooksStates {}

class MyBooksGetReadBooksErrorState extends MyBooksStates {
  final String error;

  MyBooksGetReadBooksErrorState(this.error);
}

class MyBooksGetFavouritesBooksLoadingState extends MyBooksStates {}

class MyBooksGetFavouritesBooksSuccessState extends MyBooksStates {}

class MyBooksGetFavouritesBooksErrorState extends MyBooksStates {
  final String error;

  MyBooksGetFavouritesBooksErrorState(this.error);
}

class MyBooksGoToLatestNewsState extends MyBooksStates {}
