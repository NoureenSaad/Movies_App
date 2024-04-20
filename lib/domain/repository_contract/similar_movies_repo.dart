import 'package:either_dart/either.dart';

import '../entities/MoviesEntity.dart';

abstract class SimilarRepo{
  Future<Either<List<MoviesEntity>,String>> getSimilarMovies(int movieId);
}