import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repository_contract/firebase_repo/register_repo.dart';
import '../../datasource_contract/firebase_datasource/register_datasource.dart';

@Injectable(as: RegisterRepo)
class registerRepositoryImpl extends RegisterRepo {
  RegisterDataSource registerDataSource;

  @factoryMethod
  registerRepositoryImpl({required this.registerDataSource});

  @override
  Future<Either<UserCredential, String>> register(
      {required String email,
      required String password,
      required String confirmedPassword,
      required String fullName}) async {
    var credential = await registerDataSource.register(
        email: email,
        password: password,
        confirmedPassword: confirmedPassword,
        fullName: fullName);
    return credential.fold(
      (userCredential) => Left(userCredential),
      (error) => Right(error),
    );
  }
}
