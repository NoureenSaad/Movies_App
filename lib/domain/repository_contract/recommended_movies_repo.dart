import 'package:either_dart/either.dart';
import 'package:movies_app/domain/entities/RecommendedMoviesEntity.dart';

abstract class RecommendedMoviesRepo {
  Future<Either<List<RecommendedMoviesEntity>, String>> getRecommendedMovies();
}
