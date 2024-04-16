import 'package:either_dart/either.dart';
import 'package:movies_app/domain/entities/Popular_movies_entity.dart';

abstract class PopularMoviesRepo{
  Future<Either<List<PopularMoviesEntity>,String>> getPopularMovies();
}