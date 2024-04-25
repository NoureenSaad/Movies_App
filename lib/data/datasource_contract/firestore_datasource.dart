import 'package:either_dart/either.dart';
import 'package:movies_app/domain/entities/MoviesEntity.dart';

abstract class FirestoreDataSource{
  Future<Either<Stream<List<MoviesEntity>>,String>> getMovies({required String userID});
}