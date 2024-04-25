import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import '../../../../core/firebase/helper/firestore_helper.dart';

import '../../../../core/firebase/providers/auth_provider.dart';
import '../../../../data/model/user_model/user_model.dart';
import '../../../../domain/usecases/firebase_usecases/login_usecase.dart';

@injectable
class loginViewModel extends Cubit<loginState> {
  @factoryMethod
  loginViewModel(this.loginUseCase) : super(loginInitState());

  LoginUseCase loginUseCase;

  static loginViewModel get(BuildContext context) => BlocProvider.of(context);

  login(String email, String password, BuildContext context) async {
    emit(loginLoadingState());
    var credential = await loginUseCase.callLogin(email, password);
    credential.fold((userCredential) async {
      AuthProviders provider =
          Provider.of<AuthProviders>(context, listen: false);
      try {
        UserModel? user =
            await FireStoreHelper.getUser(userCredential.user!.uid);
        provider.setUsers(userCredential.user, user);
        emit(loginSuccessState(
            userCredential));
      } catch (e) {
        emit(loginErrorState(e.toString()));
      }
    },
        (error) => emit(
              loginErrorState(error),
            ));
  }
}

abstract class loginState {}

class loginInitState extends loginState {}

class loginLoadingState extends loginState {}

class loginErrorState extends loginState {
  String errorMessage;

  loginErrorState(this.errorMessage);
}

class loginSuccessState extends loginState {
  UserCredential userCredential;

  loginSuccessState(this.userCredential);
}
