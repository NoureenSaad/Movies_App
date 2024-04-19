import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repository_contract/specific_genre_repo.dart';

import '../entities/MoviesEntity.dart';

@injectable
class SpecificGenreUseCase{
  SpecificGenreRepo genreRepo;

  @factoryMethod
  SpecificGenreUseCase(this.genreRepo);

  Future<Either<List<MoviesEntity>, String>> call(String genreID){
    return genreRepo.getSpecificGenre(genreID);
  }
}