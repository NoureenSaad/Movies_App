import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repository_contract/popular_movies_repo.dart';

import '../entities/MoviesEntity.dart';

@injectable
class PopularMoviesUseCase {
  PopularMoviesRepo popularMoviesRepo;

  @factoryMethod
  PopularMoviesUseCase(this.popularMoviesRepo);

  Future<Either<List<MoviesEntity>, String>> callPopularMovie() {
    return popularMoviesRepo.getPopularMovies();
  }
}
