import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../repository_contract/firebase_repo/login_repo.dart';

@injectable
class LoginUseCase {
  LoginRepo loginRepo;

  @factoryMethod
  LoginUseCase(this.loginRepo);

  Future<Either<UserCredential, String>> callLogin(String email, String password) {
    return loginRepo.login(email: email, password: password);
  }
}
