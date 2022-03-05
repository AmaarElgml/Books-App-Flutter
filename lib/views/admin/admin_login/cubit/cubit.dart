import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';

class AdminLoginCubit extends Cubit<AdminLoginStates> {
  AdminLoginCubit() : super(AdminLoginInitialState());

  static AdminLoginCubit get(context) => BlocProvider.of(context);
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  onLoginClicked(String? email, String? password) {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      emit(AdminLoginButtonPressedState());
    }
  }
}
