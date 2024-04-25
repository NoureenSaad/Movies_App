import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repository_contract/firebase_repo/firestore_repo.dart';

import '../../entities/MoviesEntity.dart';

@injectable
class FirestoreUseCase{
  FirestoreRepo firestoreRepo;
  @factoryMethod
  FirestoreUseCase(this.firestoreRepo);
  Future<Either<Stream<List<MoviesEntity>>, String>> getMovies(String userID){
    return firestoreRepo.getMovies(userID: userID);
  }
}