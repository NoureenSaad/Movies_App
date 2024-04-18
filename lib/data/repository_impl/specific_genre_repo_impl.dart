import 'package:either_dart/src/either.dart';
import 'package:movies_app/domain/entities/SpecificGenreEntity.dart';
import 'package:movies_app/domain/repository_contract/specific_genre_repo.dart';

class SpecificGenreRepoImpl extends SpecificGenreRepo{
  @override
  Future<Either<List<SpecificGenreEntity>, String>> getSpecificGenre() {
    // TODO: implement getSpecificGenre
    throw UnimplementedError();
  }

}