import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/firebase/helper/firestore_helper.dart';

import '../../datasource_contract/firebase_datasource/register_datasource.dart';

@Injectable(as: RegisterDataSource)
class registerDataSourceImpl extends RegisterDataSource {
  FireStoreHelper fireStoreHelper;

  @factoryMethod
  registerDataSourceImpl(this.fireStoreHelper);

  @override
  Future<Either<UserCredential, String>> register({
    required String email,
    required String password,
    required String confirmedPassword,
    required String fullName,
  }) async {
    try {
      UserCredential reg = await fireStoreHelper.createNewUser(
        email: email,
        password: password,
        fullName: fullName,
        confirmedPassword: confirmedPassword,
      );
      return Left(reg);
    } on FirebaseAuthException catch (e) {
      return Right(e.message ?? "");
    } catch (e) {
      return Right(e.toString());
    }
  }
}
