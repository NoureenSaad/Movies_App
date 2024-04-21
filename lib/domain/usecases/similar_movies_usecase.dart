import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../entities/MoviesEntity.dart';
import '../repository_contract/similar_movies_repo.dart';
@injectable
class SimilarMovieUseCase{
  SimilarRepo similarRepo ;
  @factoryMethod
  SimilarMovieUseCase(this.similarRepo);
  Future<Either<List<MoviesEntity>, String>> getSimilarMovies(int movieId){
    return similarRepo.getSimilarMovies(movieId);
  }
}