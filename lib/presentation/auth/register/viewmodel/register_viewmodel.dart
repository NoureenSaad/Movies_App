import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/firebase_usecases/register_usecase.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  @factoryMethod
  RegisterViewModel(this.registerUseCase) : super(RegisterInitState());

  static RegisterViewModel get(BuildContext context) =>
      BlocProvider.of(context);
  RegisterUseCase registerUseCase;

  register(String email, String password, String confirmedPassword,
      String fullName) async {
    emit(RegisterLoadingState());
    var credential = await registerUseCase.callRegister(
        email, password, confirmedPassword, fullName);
    credential.fold(
        (userCredential) => emit(RegisterSuccessState(userCredential)),
        (error) => emit(RegisterErrorState(error)));
  }
}

abstract class RegisterState {}

class RegisterInitState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  String errorMessage;

  RegisterErrorState(this.errorMessage);
}

class RegisterSuccessState extends RegisterState {
  UserCredential userCredential;

  RegisterSuccessState(this.userCredential);
}
