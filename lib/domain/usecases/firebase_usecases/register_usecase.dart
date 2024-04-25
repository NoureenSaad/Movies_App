import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../repository_contract/firebase_repo/register_repo.dart';

@injectable
class RegisterUseCase {
  RegisterRepo registerRepo;

  @factoryMethod
  RegisterUseCase(this.registerRepo);

  Future<Either<UserCredential, String>> callRegister(String email, String password,
      String confirmedPassword, String fullName) {
    return registerRepo.register(
        email: email,
        password: password,
        confirmedPassword: confirmedPassword,
        fullName: fullName);
  }
}
