import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import 'package:movies_app/core/firebase/helper/firestore_helper.dart';

import '../../../core/firebase_auth_error_codes.dart';
import '../../datasource_contract/firebase_datasource/login_datasource.dart';

@Injectable(as: LoginDataSource)
class LoginDataSourceImpl extends LoginDataSource {
  FireStoreHelper fireStoreHelper;

  @factoryMethod
  LoginDataSourceImpl(this.fireStoreHelper);

  @override
  Future<Either<UserCredential, String>> login(
      {required String email, required String password}) async {
    try {
      UserCredential credential =
          await fireStoreHelper.login(email: email, password: password);
      return Left(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseAuthErrorCodes.userNotFound) {
        return const Right('No user found for that email.');
      } else if (e.code == FirebaseAuthErrorCodes.wrongPassword) {
        return const Right('Wrong password provided for that user.');
      }
    } catch (e) {
      return Right(e.toString());
    }
    return const Right('Something went wrong. Please try again later.');
  }
}
