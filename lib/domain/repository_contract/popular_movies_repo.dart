import 'package:either_dart/either.dart';

import '../entities/MoviesEntity.dart';

abstract class PopularMoviesRepo {
  Future<Either<List<MoviesEntity>, String>> getPopularMovies();
}
