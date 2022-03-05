import 'package:books_store_app/repositories/books/books_api.dart';
import 'package:books_store_app/shared_view_models/book_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../mybooks_view_model.dart';
import 'states.dart';

class MyBooksCubit extends Cubit<MyBooksStates> {
  MyBooksCubit() : super(MyBooksInitialState());

  static MyBooksCubit get(context) => BlocProvider.of(context);

  MyBooksViewModel myBooksViewModel = MyBooksViewModel(BooksAPI());
  final String pageTitle = 'My Books';
  int listNum = 0;

  void setTapNum(int num) {
    this.listNum = num;
  }

  void onTabBarTapped(index) {
    listNum = index;
    emit(MyBooksChangeTabState());
  }

  List<String> titles = [
    'Currently Reading',
    'Wants to Read',
    'Read',
    'Favourites',
  ];

  List<BookViewModel> whichListTapped(index) {
    return index == 0
        ? currentlyReading
        : index == 1
            ? wantsToRead
            : index == 2
                ? read
                : favourites;
  }

  List<BookViewModel> currentlyReading = [];

  void getCurrentlyReadingBooks() {
    emit(MyBooksGetCurrentlyReadingBooksLoadingState());
    myBooksViewModel.fetchCurrentlyReadingBooks().then((value) {
      currentlyReading = value;
      emit(MyBooksGetCurrentlyReadingBooksSuccessState());
    }).catchError((error) {
      emit(MyBooksGetCurrentlyReadingBooksErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<BookViewModel> wantsToRead = [];

  void getWantsToReadBooks() {
    emit(MyBooksGetWantsToReadLoadingState());
    myBooksViewModel.fetchCurrentlyReadingBooks().then((value) {
      wantsToRead = value;
      emit(MyBooksGetWantsToReadSuccessState());
    }).catchError((error) {
      emit(MyBooksGetWantsToReadErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<BookViewModel> read = [];

  void getReadBooks() {
    emit(MyBooksGetReadBooksLoadingState());
    myBooksViewModel.fetchCurrentlyReadingBooks().then((value) {
      read = value;
      emit(MyBooksGetReadBooksSuccessState());
    }).catchError((error) {
      emit(MyBooksGetReadBooksErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<BookViewModel> favourites = [];

  void getFavouritesBooks() {
    emit(MyBooksGetFavouritesBooksLoadingState());
    myBooksViewModel.fetchCurrentlyReadingBooks().then((value) {
      favourites = value;
      emit(MyBooksGetFavouritesBooksSuccessState());
    }).catchError((error) {
      emit(MyBooksGetFavouritesBooksErrorState(error.toString()));
      print(error.toString());
    });
  }

  void goToLatestNewsPage() {
    emit(MyBooksGoToLatestNewsState());
  }

// final MyBooksViewModel MyBooksViewModel =
//     MyBooksViewModel(booksRepository: BooksAPI());
//
// List<BookViewModel> trendingBooks = [];
// List<AuthorViewModel> topAuthors = [];
//
// void getBooks() {
//   emit(MyBooksGetBooksLoadingState());
//   MyBooksViewModel.fetchAllBooks().then((value) {
//     trendingBooks = value;
//     emit(MyBooksGetBooksSuccessState());
//   }).catchError((error) {
//     emit(MyBooksGetBooksErrorState(error.toString()));
//     print(error.toString());
//   });
// }
//
// void getTopAuthors() {
//   topAuthors = fakeAuthors
//       .map((author) => AuthorViewModel(author: author))
//       // Pick 7 as the current top authors
//       .take(7)
//       .toList();
// }
}
