import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repository_contract/recommended_movies_repo.dart';

import '../entities/MoviesEntity.dart';


@injectable
class RecommendedMoviesUseCase {
  RecommendedMoviesRepo recommendedMoviesRepo;

  @factoryMethod
  RecommendedMoviesUseCase(this.recommendedMoviesRepo);

  Future<Either<List<MoviesEntity>, String>> callRecommendedMovies() {
    return recommendedMoviesRepo.getRecommendedMovies();
  }
}
