import 'package:either_dart/either.dart';
import 'package:movies_app/domain/entities/MoviesGenreEntity.dart';

abstract class MoviesGenresRepo{
  Future<Either<List<MoviesGenreEntity>,String>> getMoviesGenres();
}