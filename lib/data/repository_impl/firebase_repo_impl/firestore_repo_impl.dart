import 'package:either_dart/either.dart';
import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/datasource_contract/firebase_datasource/firestore_datasource.dart';
import 'package:movies_app/domain/entities/MoviesEntity.dart';
import 'package:movies_app/domain/repository_contract/firebase_repo/firestore_repo.dart';

@Injectable(as: FirestoreRepo)
class FirestoreRepoImpl extends FirestoreRepo{
  FirestoreDataSource firestoreDataSource;
  @factoryMethod
  FirestoreRepoImpl(this.firestoreDataSource);
  @override
  Future<Either<Stream<List<MoviesEntity>>, String>> getMovies({required String userID}) {
    var result = firestoreDataSource.getMovies(userID: userID);
    return result.fold((response){
      return Left(response);
    },
    (error){
      return Right(error.toString());
    });
  }

}