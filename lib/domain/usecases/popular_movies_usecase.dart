import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/Popular_movies_entity.dart';
import 'package:movies_app/domain/repository_contract/popular_movies_repo.dart';

@injectable
class PopularMoviesUseCase {
  PopularMoviesRepo popularMoviesRepo;

  @factoryMethod
  PopularMoviesUseCase(this.popularMoviesRepo);

  Future<Either<List<PopularMoviesEntity>, String>> callPopularMovie() {
    return popularMoviesRepo.getPopularMovies();
  }
}
