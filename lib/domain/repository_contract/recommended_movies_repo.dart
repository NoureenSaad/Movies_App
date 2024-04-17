import 'package:either_dart/either.dart';

import '../entities/MoviesEntity.dart';

abstract class RecommendedMoviesRepo {
  Future<Either<List<MoviesEntity>, String>> getRecommendedMovies();
}
