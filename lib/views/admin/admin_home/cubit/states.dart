abstract class AdminHomeStates {}

class AdminHomeInitialState extends AdminHomeStates {}

class AdminHomeLogOutPressedState extends AdminHomeStates {}
class AdminHomeLogOutState extends AdminHomeStates {}

class AdminHomeOpenAdminOptionState extends AdminHomeStates {
  final int whichOption;

  AdminHomeOpenAdminOptionState(this.whichOption);
}


