import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterDataSource {
  Future<Either<UserCredential, String>> register({
    required String email,
    required String password,
    required String confirmedPassword,
    required String fullName,
  });
}
