import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repository_contract/firebase_repo/login_repo.dart';
import '../../datasource_contract/firebase_datasource/login_datasource.dart';

@Injectable(as: LoginRepo)
class LoginRepositoryImpl extends LoginRepo {
  LoginDataSource loginDataSource;

  @factoryMethod
  LoginRepositoryImpl(this.loginDataSource);

  @override
  Future<Either<UserCredential, String>> login(
      {required String email, required String password}) async {
    var credential =
        await loginDataSource.login(email: email, password: password);
    return credential.fold(
      (userCredential) => Left(userCredential),
      (error) => Right(error),
    );
  }
}
