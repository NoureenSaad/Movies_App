import 'package:either_dart/either.dart';
import 'package:movies_app/domain/entities/MoviesDetailsEntity.dart';

abstract class MovieDetailsRepo {
  Future<Either<MoviesDetailsEntity, String>> getMovieDetails(int movieId);
}
