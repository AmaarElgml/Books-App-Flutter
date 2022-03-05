import 'package:books_store_app/repositories/news/news_api.dart';
import 'package:books_store_app/shared_view_models/news_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../latest_news_view_model.dart';
import 'states.dart';

class LatestNewsCubit extends Cubit<LatestNewsStates> {
  final String titlePage = 'Latest News';
  final String managePageTitle = 'Manage News';
  LatestNewsCubit() : super(LatestNewsInitialState());

  static LatestNewsCubit get(context) => BlocProvider.of(context);
  final LatestNewsViewModel viewModel = LatestNewsViewModel(newsRepository: NewsAPI());
  List<NewsViewModel> latestNews = [];

  void getLatestNews() {
    emit(LatestNewsGetNewsLoadingState());
    viewModel.fetchLatestNews().then((value) {
      latestNews = value;
      emit(LatestNewsGetNewsSuccessState());
    }).catchError((error) {
      emit(LatestNewsGetNewsErrorState(error.toString()));
      print(error.toString());
    });
  }

  IconData getAppropriateIcon(String type) {
    return (type == 'Good')
        ? FontAwesomeIcons.smileBeam
        : (type == 'Bad')
            ? FontAwesomeIcons.sadTear
            : (type == 'Completed')
                ? FontAwesomeIcons.checkCircle
                : FontAwesomeIcons.newspaper;
  }

  void onAddNewsPressed() {
    emit(LatestNewsAddNewsPressedState());
  }
}
