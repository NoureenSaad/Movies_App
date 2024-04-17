import 'package:either_dart/either.dart';
import 'package:movies_app/domain/entities/SpecificGenreEntity.dart';

abstract class SpecificGenreRepo{
  Future<Either<List<SpecificGenreEntity>, String>> getSpecificGenre();
}