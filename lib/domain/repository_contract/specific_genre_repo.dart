import 'package:either_dart/either.dart';
import 'package:movies_app/domain/entities/MoviesEntity.dart';

abstract class SpecificGenreRepo{
  Future<Either<List<MoviesEntity>, String>> getSpecificGenre(String genreID);
}