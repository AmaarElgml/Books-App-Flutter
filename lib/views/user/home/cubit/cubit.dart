import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared_view_models/author_view_model.dart';
import '../../../../shared_view_models/book_view_model.dart';
import '../../../../repositories/books/books_api.dart';
import '../../../../repositories/authors/authors_api.dart';
import '../home_view_model.dart';
import 'states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  final String pageTitle = "Manage Books";
  final String pageAuthorTitle = 'Manage Authors';
  final String explainingShuffling =
      'Compute, and change the current trending authors,\nsee if there are new trending authors to add them.';

  static HomeCubit get(context) => BlocProvider.of(context);

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> getScaffoldKey() {
    return scaffoldKey;
  }

  // Constructor Injection
  final HomeViewModel homeViewModel = HomeViewModel(
      booksRepository: BooksAPI(), authorsRepository: AuthorsAPI());

  List<BookViewModel> trendingBooks = [];
  List<AuthorViewModel> topAuthors = [];

  void getBooks() {
    emit(HomeGetBooksLoadingState());
    homeViewModel.fetchAllBooks().then((value) {
      trendingBooks = value;
      emit(HomeGetBooksSuccessState());
    }).catchError((error) {
      emit(HomeGetBooksErrorState(error.toString()));
      print(error.toString());
    });
  }

  void getAuthors() {
    emit(HomeGetAuthorsLoadingState());
    homeViewModel.fetchAllAuthors().then((value) {
      topAuthors = value;
      emit(HomeGetAuthorsSuccessState());
    }).catchError((error) {
      emit(HomeGetAuthorsErrorState(error.toString()));
      print(error.toString());
    });
  }

  void searchButtonPressed() {
    emit(HomeSearchBookPressedState());
  }

  void searchQuery(String query) {}

  void addBookPressed() {
    emit(HomeAddBookPressedState());
  }

  void onAddAuthorPressed() {
    emit(HomeAddAuthorPressedState());
  }

  void checkIfChangesInTopAuthors() {
    emit(HomeCheckTrendingAuthorsState());
  }
}
