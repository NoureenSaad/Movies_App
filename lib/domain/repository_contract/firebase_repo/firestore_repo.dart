import 'package:either_dart/either.dart';
import '../../entities/MoviesEntity.dart';

abstract class FirestoreRepo{
  Future<Either<Stream<List<MoviesEntity>>, String>> getMovies({required String userID});
}