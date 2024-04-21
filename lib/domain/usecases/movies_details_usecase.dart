import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/MoviesDetailsEntity.dart';

import '../repository_contract/movies_details_repo.dart';

@injectable
class MovieDetailsUseCase {
  MovieDetailsRepo movieDetailsRepo;

  @factoryMethod
  MovieDetailsUseCase(this.movieDetailsRepo);

  Future<Either<MoviesDetailsEntity, String>> getMovieDetails(int movieId) {
    return movieDetailsRepo.getMovieDetails(movieId);
  }
}
