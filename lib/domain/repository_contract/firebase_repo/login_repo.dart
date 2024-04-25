import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepo {
  Future<Either<UserCredential, String>> login(
      {required String email, required String password});
}
