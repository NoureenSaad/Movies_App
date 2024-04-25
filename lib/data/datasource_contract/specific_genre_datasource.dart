import 'package:either_dart/either.dart';
import 'package:movies_app/data/model/SpecificGenreResponse/SpecificGenreResponse.dart';

abstract class SpecificGenreDataSource{
  Future<Either<SpecificGenreResponse, String>> getSpecificGenre(String genreID);
}