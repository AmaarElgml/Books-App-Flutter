abstract class LatestNewsStates {}

class LatestNewsInitialState extends LatestNewsStates {}

class LatestNewsGetNewsLoadingState extends LatestNewsStates {}

class LatestNewsGetNewsSuccessState extends LatestNewsStates {}

class LatestNewsAddNewsPressedState extends LatestNewsStates {}

class LatestNewsGetNewsErrorState extends LatestNewsStates {
  final String error;

  LatestNewsGetNewsErrorState(this.error);
}
